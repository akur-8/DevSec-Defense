##############################################################################\n##\n## Convert-TextObject\n##\n## From Windows PowerShell Cookbook (O'Reilly)\n## by Lee Holmes (http://www.leeholmes.com/guide)\n##\n##############################################################################\n\n<#\n\n.SYNOPSIS\n\nConvert a simple string into a custom PowerShell object.\n\n.EXAMPLE\n\n"Hello World" | Convert-TextObject\nGenerates an Object with "P1=Hello" and "P2=World"\n\n.EXAMPLE\n\n"Hello World" | Convert-TextObject -Delimiter "ll"\nGenerates an Object with "P1=He" and "P2=o World"\n\n.EXAMPLE\n\n"Hello World" | Convert-TextObject -Pattern "He(ll.*o)r(ld)"\nGenerates an Object with "P1=llo Wo" and "P2=ld"\n\n.EXAMPLE\n\n"Hello World" | Convert-TextObject -PropertyName FirstWord,SecondWord\nGenerates an Object with "FirstWord=Hello" and "SecondWord=World\n\n.EXAMPLE\n\n"123 456" | Convert-TextObject -PropertyType $([string],[int])\nGenerates an Object with "Property1=123" and "Property2=456"\nThe second property is an integer, as opposed to a string\n\n.EXAMPLE\n\nPS >$ipAddress = (ipconfig | Convert-TextObject -Delim ": ")[2].P2\nPS >$ipAddress\n192.168.1.104\n\n#>\n\n[CmdletBinding(DefaultParameterSetName = "ByDelimiter")]\nparam(\n    ## If specified, gives the .NET Regular Expression with which to\n    ## split the string. The script generates properties for the\n    ## resulting object out of the elements resulting from this split.\n    ## If not specified, defaults to splitting on the maximum amount\n    ## of whitespace: "\\s+", as long as Pattern is not\n    ## specified either.\n    [Parameter(ParameterSetName = "ByDelimiter", Position = 0)]\n    [string] $Delimiter = "\\s+",\n\n    ## If specified, gives the .NET Regular Expression with which to\n    ## parse the string. The script generates properties for the\n    ## resulting object out of the groups captured by this regular\n    ## expression.\n    [Parameter(Mandatory = $true,\n        ParameterSetName = "ByPattern",\n        Position = 0)]\n    [string] $Pattern,\n\n    ## If specified, the script will pair the names from this object\n    ## definition with the elements from the parsed string.  If not\n    ## specified (or the generated object contains more properties\n    ## than you specify,) the script uses property names in the\n    ## pattern of P1,P2,...,PN\n    [Parameter(Position = 1)]\n    [Alias("PN")]\n    [string[]] $PropertyName = @(),\n\n    ## If specified, the script will pair the types from this list with\n    ## the properties from the parsed string.  If not specified (or the\n    ## generated object contains more properties than you specify,) the\n    ## script sets the properties to be of type [string]\n    [Parameter(Position = 2)]\n    [Alias("PT")]\n    [type[]] $PropertyType = @(),\n\n    ## The input object to process\n    [Parameter(ValueFromPipeline = $true)]\n    [string] $InputObject\n)\n\nbegin {\n    Set-StrictMode -Version Latest\n}\n\nprocess {\n    $returnObject = New-Object PSObject\n\n    $matches = $null\n    $matchCount = 0\n\n    if($PSBoundParameters["Pattern"])\n    {\n        ## Verify that the input contains the pattern\n        ## Populates the matches variable by default\n        if(-not ($InputObject -match $pattern))\n        {\n            return\n        }\n\n        $matchCount = $matches.Count\n    $startIndex = 1\n    }\n    else\n    {\n        ## Verify that the input contains the delimiter\n        if(-not ($InputObject -match $delimiter))\n        {\n            return\n        }\n\n        ## If so, split the input on that delimiter\n        $matches = $InputObject -split $delimiter\n        $matchCount = $matches.Length\n        $startIndex = 0\n    }\n\n    ## Go through all of the matches, and add them as notes to the output\n    ## object.\n    for($counter = $startIndex; $counter -lt $matchCount; $counter++)\n    {\n        $currentPropertyName = "P$($counter - $startIndex + 1)"\n        $currentPropertyType = [string]\n\n        ## Get the property name\n        if($counter -lt $propertyName.Length)\n        {\n            if($propertyName[$counter])\n            {\n                $currentPropertyName = $propertyName[$counter - 1]\n            }\n        }\n\n        ## Get the property value\n        if($counter -lt $propertyType.Length)\n        {\n            if($propertyType[$counter])\n            {\n                $currentPropertyType = $propertyType[$counter - 1]\n            }\n        }\n\n        Add-Member -InputObject $returnObject NoteProperty `\n            -Name $currentPropertyName `\n            -Value ($matches[$counter].Trim() -as $currentPropertyType)\n    }\n\n    $returnObject\n}