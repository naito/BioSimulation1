
# created by eml2em program
# from file: BIOMD0000000233.eml, date: Tue Nov 11 04:57:10 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( r1 )
	{
		Name	r1;
		k1	8.0;
		Expression	"k1 * S.NumberConc * Y.NumberConc";
		VariableReferenceList
			[ S Variable:/batch:S 0  ]
			[ Y Variable:/batch:Y -1 ]
			[ X Variable:/batch:X 2  ];
	}
	
	Process ExpressionFluxProcess( r2 )
	{
		Name	r2;
		k2	1.0;
		Expression	"k2 * pow(X.NumberConc, 2)";
		VariableReferenceList
			[ X Variable:/batch:X -1 ]
			[ Y Variable:/batch:Y 1  ];
	}
	
	Process ExpressionFluxProcess( r3 )
	{
		Name	r3;
		k3	1.0;
		Expression	"k3 * X.NumberConc * Y.NumberConc";
		VariableReferenceList
			[ X Variable:/batch:X -1 ]
			[ Y Variable:/batch:Y 0  ]
			[ P Variable:/batch:P 0  ];
	}
	
	Process ExpressionFluxProcess( r4 )
	{
		Name	r4;
		k4	1.5;
		Expression	"k4 * X.NumberConc";
		VariableReferenceList
			[ X Variable:/batch:X -1 ]
			[ P Variable:/batch:P 0  ];
	}
	
	
}

System System( /batch )
{
	StepperID	Default;
	Name	batch;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( S )
	{
		Name	S;
		NumberConc	1.0;
		Fixed	1;
	}
	
	Variable Variable( P )
	{
		Name	P;
		NumberConc	1.0;
		Fixed	1;
	}
	
	Variable Variable( X )
	{
		Name	X;
		NumberConc	1.0;
		Fixed	0;
	}
	
	Variable Variable( Y )
	{
		Name	Y;
		NumberConc	1.0;
		Fixed	0;
	}
	
	
}

