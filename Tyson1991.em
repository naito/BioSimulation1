
# created by eml2em program
# from file: BIOMD0000000005.eml, date: Tue Sep 30 09:49:28 2014
#

Stepper ODEStepper( Default )
{
    # no property
}

System System( / )
{
    StepperID  Default;
    Name  default;
}

System System( /cell )
{
    StepperID  Default;

    Variable Variable( SIZE )
    {
        Value  1.0;
    }
    
    Variable Variable( C2 )
    {
        Name  cdc2k;
        Value  0.0;
    }
    
    Variable Variable( CP )
    {
        Name  "cdc2k-P";
        Value  0.75;
    }
    
    Variable Variable( M )
    {
        Name  "p-cyclin_cdc2";
        Value  0.0;
    }
    
    Variable Variable( pM )
    {
        Name  "p-cyclin_cdc2-p";
        Value  0.25;
    }
    
    Variable Variable( Y )
    {
        Name  cyclin;
        Value  0.0;
    }
    
    Variable Variable( YP )
    {
        Name  "p-cyclin";
        Value  0.0;
    }
    
    Variable Variable( YT )
    {
        Name  total_cyclin;
        Value  0.25;
    }
    
    Variable Variable( CT )
    {
        Name  total_cdc2;
        Value  1.0;
    }

### Reactions ###

    Process ExpressionFluxProcess( R1 )
    {
        Name  "cyclin biosynthesis";
        k1aa  0.015;
        Expression  "k1aa";
        VariableReferenceList
            [ Y   :.:Y  1 ];
    }
    
    Process ExpressionFluxProcess( R2 )
    {
        Name  "default degradation of cyclin";
        k2  0.0;
        Expression  "k2 * Y.Value";
        VariableReferenceList
            [ Y   :.:Y  -1 ];
    }
    
    Process ExpressionFluxProcess( R3 )
    {
        Name  "cyclin cdc2k-p association";
        k3  200.0;
        Expression  "CP.Value * k3 * Y.Value";
        VariableReferenceList
            [ CP   :.:CP  -1 ]
            [ Y    :.:Y   -1 ]
            [ pM   :.:pM   1 ];
    }
    
    Process ExpressionFluxProcess( R4 )
    {
        Name  "activation of cdc2 kinase";
        k4  180.0;
        k4prime  0.018;
        Expression  "pM.Value * (k4prime + k4 * pow(M.Value / CT.Value, 2))";
        VariableReferenceList
            [ pM   :.:pM  -1 ]
            [ M    :.:M    1 ]
            [ CT   :.:CT   0 ];
    }
    
    Process ExpressionFluxProcess( R5 )
    {
        Name  "deactivation of cdc2 kinase";
        k5_P  0.0;
        Expression  "k5_P * M.Value";
        VariableReferenceList
            [ M    :.:M   -1 ]
            [ pM   :.:pM   1 ];
    }
    
    Process ExpressionFluxProcess( R6 )
    {
        Name  "cyclin_cdc2k dissociation";
        k6  1.0;
        Expression  "k6 * M.Value";
        VariableReferenceList
            [ M    :.:M   -1 ]
            [ C2   :.:C2   1 ]
            [ YP   :.:YP   1 ];
    }
    
    Process ExpressionFluxProcess( R7 )
    {
        Name  "cdc2 kinase triggered degration of cyclin";
        k7  0.6;
        Expression  "k7 * YP.Value";
        VariableReferenceList
            [ YP   :.:YP  -1 ];
    }
    
    Process ExpressionFluxProcess( R8 )
    {
        Name  "cdc2k phosphorylation";
        k8_P  1000000.0;
        Expression  "C2.Value * k8_P";
        VariableReferenceList
            [ C2   :.:C2  -1 ]
            [ CP   :.:CP   1 ];
    }
    
    Process ExpressionFluxProcess( R9 )
    {
        Name  "cdc2k dephosphorylation";
        k9  1000.0;
        Expression  "CP.Value * k9";
        VariableReferenceList
            [ CP   :.:CP  -1 ]
            [ C2   :.:C2   1 ];
    }

### Assignment total ammounts ###

    Process ExpressionAssignmentProcess( YT )
    {
        StepperID  Default;
        Name  "Assignment rule for 'YT'";
        Expression  "Y.Value + YP.Value + M.Value + pM.Value";
        VariableReferenceList
            [ YT :.:YT  1 ]
            [ Y  :.:Y   0 ]
            [ YP :.:YP  0 ]
            [ M  :.:M   0 ]
            [ pM :.:pM  0 ];
    }
    
    Process ExpressionAssignmentProcess( CT )
    {
        StepperID  Default;
        Name  "Assignment rule for 'CT'";
        Expression  "C2.Value + CP.Value + M.Value + pM.Value";
        VariableReferenceList
            [ CT :.:CT  1 ]
            [ C2 :.:C2  0 ]
            [ CP :.:CP  0 ]
            [ M  :.:M   0 ]
            [ pM :.:pM  0 ];
    }

}

