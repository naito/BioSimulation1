Stepper ODEStepper( Default ) {}

System System( / )
{
    StepperID  Default;

    Variable Variable( u ) { Value  0.0; }
    Variable Variable( v ) { Value  0.0; }
    
    Process ExpressionFluxProcess( dudt )
    {
        c  10.0;
        I  0.5;
        Expression  "c * ( -v.Value + u.Value - pow( u.Value, 3.0 )/3.0 + I )";
        VariableReferenceList
            [ u   :.:u  1 ]
            [ v   :.:v  0 ];
    }
    
    Process ExpressionFluxProcess( dvdt )
    {
        a  0.7;
        b  0.8;
        Expression  "u.Value - b * v.Value + a";
        VariableReferenceList
            [ u   :.:u  0 ]
            [ v   :.:v  1 ];
    }
}
