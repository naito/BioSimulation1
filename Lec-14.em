Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	
	Variable Variable( S )
	{
		Name	S;
		Value	1.0;
	}
	
	Variable Variable( P )
	{
		Name	P;
		Value	1.0;
	}
	
	Variable Variable( X )
	{
		Name	X;
		Value	1.0;
	}
	
	Variable Variable( Y )
	{
		Name	Y;
		Value	1.0;
	}

	Process ExpressionFluxProcess( r1 )
	{
		Name	r1;
		k1	8.0;
		Expression	"k1 * S.Value * Y.Value";
		VariableReferenceList
			[ S :/:S  0 ]
			[ Y :/:Y -1 ]
			[ X :/:X  2 ];
	}
	
	Process ExpressionFluxProcess( r2 )
	{
		Name	r2;
		k2	1.0;
		Expression	"k2 * pow(X.Value, 2)";
		VariableReferenceList
			[ X :/:X -1 ]
			[ Y :/:Y  1 ];
	}
	
	Process ExpressionFluxProcess( r3 )
	{
		Name	r3;
		k3	1.0;
		Expression	"k3 * X.Value * Y.Value";
		VariableReferenceList
			[ X :/:X -1 ]
			[ Y :/:Y  0 ]
			[ P :/:P  0 ];
	}
	
	Process ExpressionFluxProcess( r4 )
	{
		Name	r4;
		k4	1.5;
		Expression	"k4 * X.Value";
		VariableReferenceList
			[ X :/:X -1 ]
			[ P :/:P  0 ];
	}
}

