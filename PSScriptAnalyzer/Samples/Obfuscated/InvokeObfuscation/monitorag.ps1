



Param
(
    
    [Parameter(MaNdaToRY=${T`RuE})]
    [string] ${SeRVe`RNa`ME},

    
    [Parameter(manDaTORy=${TR`UE})]
    [string] ${Gro`UP`NAme}
)








${S`E`RveR`Object} = &("{0}{2}{3}{1}" -f'New','t','-O','bjec') ("{4}{7}{1}{3}{8}{0}{2}{5}{6}"-f'me','osoft','nt','.Sq','M','.SMO','.Server','icr','lServer.Manage')(${S`ERv`eRnA`mE})
${S`ERVEro`BJEcT}."setDefau`ltINiT`F`IELDS"([Microsoft.SqlServer.Management.Smo.AvailabilityGroup], ${t`RuE})
${Serv`er`oBjE`ct}."se`TdefaU`Lti`N`I`TFIELDS"([Microsoft.SqlServer.Management.Smo.AvailabilityReplica], ${tr`Ue})
${Server`oB`jECt}."S`eTdE`F`AU`LTI`NitFIELDS"([Microsoft.SqlServer.Management.Smo.DatabaseReplicaState], ${T`RuE})


${g`RoUp`OBJEcT} = ${SE`Rv`e`RoBJe`Ct}."aVAilaBiLI`TY`gRo`u`ps"[${grouP`Na`mE}]

if(${GROUP`OBJ`ecT} -eq ${n`ULl})
{
    
    throw ('Th'+'e '+'av'+'ailabili'+'ty'+' '+'g'+'roup '+"'$GroupName' "+'do'+'es '+'not'+' '+'ex'+'is'+'t '+'o'+'n '+'s'+'e'+'rver '+"'$ServerName'.")
}
elseif(${g`RoUpoB`Je`Ct}."P`RIm`ARYReP`L`IcaseRVE`RName" -eq ${n`uLL})
{
    
    throw ('Ca'+'nnot '+'d'+'ete'+'rmi'+'ne '+'the'+' '+'p'+'rimary'+' '+'replic'+'a '+'o'+'f '+'availab'+'il'+'i'+'ty '+'gr'+'oup '+"'$GroupName' "+'fr'+'om '+'s'+'er'+'ver '+'in'+'stance'+' '+"'$ServerName'. "+'Ple'+'ase '+'investig'+'at'+'e!') 
}
elseif(${GROUp`ob`j`eCt}."p`RiMaRyR`E`pLIc`ASE`R`Ver`NaME" -ne ${S`Erve`RNaME})
{
    
    
    &("{1}{0}{2}"-f'rite-Warni','W','ng') ('Th'+'e '+'ser'+'ver'+' '+'instance'+' '+"'$ServerName' "+'is'+' '+'n'+'ot '+'th'+'e '+'p'+'ri'+'mary '+'replic'+'a '+'f'+'or '+'th'+'e '+'av'+'aila'+'bility '+'gr'+'o'+'up '+"'$GroupName'. "+'S'+'kipp'+'i'+'ng '+'e'+'valuat'+'ion.')
}
else 
{
    
    ${G`R`oUpresUlt} = &("{2}{1}{0}{3}{5}{6}{4}"-f'la','est-SqlAvai','T','bili','p','tyGro','u') ${GroUPO`BJE`ct} -NoRefresh
    ${Repl`ic`A`RESults} = @(${G`RO`UPoBje`CT}."aVa`IlaBilIt`YrepL`I`cAs" | &("{5}{2}{3}{0}{1}{4}"-f'b','ilit','q','lAvaila','yReplica','Test-S') -NoRefresh)
    ${dAT`AbAse`REsUL`TS} = @(${g`Rou`pobJeCT}."daTa`BA`serEP`lICASTATes" | .("{0}{4}{6}{2}{5}{3}{1}" -f'Test','tate','lD','baseReplicaS','-S','ata','q') -NoRefresh)
    
    
    ${GrOU`pi`sC`RIT`iC`AL} = ${grou`pr`es`ulT}."he`ALThs`TAte" -eq ("{0}{1}"-f'Er','ror')
    ${C`Ri`T`ICalRePl`Ic`As} = @(${rePli`CAr`EsUL`Ts} | .("{2}{1}{0}{3}" -f'e-Objec','her','W','t') { ${_}."HeALTH`S`TA`Te" -eq ("{0}{1}" -f 'Er','ror') })
    ${CRi`TIC`ALDA`TaB`AseS} = @(${Da`TAb`ASereS`uLTS} | &("{0}{1}{2}" -f'Where-O','bje','ct') { ${_}."H`Ealt`HSTATe" -eq ("{1}{0}"-f'ror','Er') })

    
    if(${gr`OUpisc`Ri`Ti`CaL} -or ${CRItIC`AL`Rep`LI`cas}."COU`NT" -gt 0 -or ${Cr`iTIcaL`Da`TAba`SeS}."cOU`NT" -gt 0)
    {
        throw ('The'+' '+'a'+'vail'+'a'+'bility '+'gr'+'ou'+'p '+"'$GroupName' "+'has'+' '+'obj'+'ec'+'ts '+'in'+' '+'t'+'he '+'cr'+'iti'+'cal '+'s'+'t'+'ate! '+'Pleas'+'e '+'inve'+'st'+'igate'+'.')
    }
}

