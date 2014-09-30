
# created by eml2em program
# from file: BIOMD0000000005.eml, date: Tue Sep 30 09:49:28 2014
#

Stepper ODEStepper( Default )
{
	# no property
}

System System( / )
{
	StepperID	Default;
	Name	default;

	Process ExpressionFluxProcess( Reaction1 )
	{
		Name	"cyclin_cdc2k dissociation";
		k6	1.0;
		Expression	"cell.Value * k6 * M.NumberConc";
		VariableReferenceList
			[ M    Variable:/cell:M    -1 ]
			[ C2   Variable:/cell:C2   1  ]
			[ YP   Variable:/cell:YP   1  ]
			[ cell Variable:/cell:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( Reaction2 )
	{
		Name	"cdc2k phosphorylation";
		k8notP	1000000.0;
		Expression	"cell.Value * C2.NumberConc * k8notP";
		VariableReferenceList
			[ C2   Variable:/cell:C2   -1 ]
			[ CP   Variable:/cell:CP   1  ]
			[ cell Variable:/cell:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( Reaction3 )
	{
		Name	"cdc2k dephosphorylation";
		k9	1000.0;
		Expression	"cell.Value * CP.NumberConc * k9";
		VariableReferenceList
			[ CP   Variable:/cell:CP   -1 ]
			[ C2   Variable:/cell:C2   1  ]
			[ cell Variable:/cell:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( Reaction4 )
	{
		Name	"cyclin cdc2k-p association";
		k3	200.0;
		Expression	"cell.Value * CP.NumberConc * k3 * Y.NumberConc";
		VariableReferenceList
			[ CP   Variable:/cell:CP   -1 ]
			[ Y    Variable:/cell:Y    -1 ]
			[ pM   Variable:/cell:pM   1  ]
			[ cell Variable:/cell:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( Reaction5 )
	{
		Name	"deactivation of cdc2 kinase";
		k5notP	0.0;
		Expression	"cell.Value * k5notP * M.NumberConc";
		VariableReferenceList
			[ M    Variable:/cell:M    -1 ]
			[ pM   Variable:/cell:pM   1  ]
			[ cell Variable:/cell:SIZE 0  ];
	}
	
	Process ExpressionFluxProcess( Reaction6 )
	{
		Name	"cyclin biosynthesis";
		k1aa	0.015;
		Expression	"cell.Value * k1aa";
		VariableReferenceList
			[ EmptySet Variable:/cell:EmptySet -1 ]
			[ Y        Variable:/cell:Y        1  ]
			[ cell     Variable:/cell:SIZE     0  ];
	}
	
	Process ExpressionFluxProcess( Reaction7 )
	{
		Name	"default degradation of cyclin";
		k2	0.0;
		Expression	"cell.Value * k2 * Y.NumberConc";
		VariableReferenceList
			[ Y        Variable:/cell:Y        -1 ]
			[ EmptySet Variable:/cell:EmptySet 1  ]
			[ cell     Variable:/cell:SIZE     0  ];
	}
	
	Process ExpressionFluxProcess( Reaction8 )
	{
		Name	"cdc2 kinase triggered degration of cyclin";
		k7	0.6;
		Expression	"cell.Value * k7 * YP.NumberConc";
		VariableReferenceList
			[ YP       Variable:/cell:YP       -1 ]
			[ EmptySet Variable:/cell:EmptySet 1  ]
			[ cell     Variable:/cell:SIZE     0  ];
	}
	
	Process ExpressionFluxProcess( Reaction9 )
	{
		Name	"activation of cdc2 kinase";
		k4	180.0;
		k4prime	0.018;
		Expression	"cell.Value * pM.NumberConc * (k4prime + k4 * pow(M.NumberConc / CT.NumberConc, 2))";
		VariableReferenceList
			[ pM   Variable:/cell:pM   -1 ]
			[ M    Variable:/cell:M    1  ]
			[ CT   Variable:/cell:CT   0  ]
			[ cell Variable:/cell:SIZE 0  ];
	}
	
	
}

System System( /cell )
{
	StepperID	Default;

	Variable Variable( Dimensions )
	{
		Value	3;
	}
	
	Variable Variable( SIZE )
	{
		Value	1.0;
		Fixed	1;
	}
	
	Variable Variable( EmptySet )
	{
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( C2 )
	{
		Name	cdc2k;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( CP )
	{
		Name	"cdc2k-P";
		Value	0.75;
		Fixed	0;
	}
	
	Variable Variable( M )
	{
		Name	"p-cyclin_cdc2";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( pM )
	{
		Name	"p-cyclin_cdc2-p";
		Value	0.25;
		Fixed	0;
	}
	
	Variable Variable( Y )
	{
		Name	cyclin;
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( YP )
	{
		Name	"p-cyclin";
		Value	0.0;
		Fixed	0;
	}
	
	Variable Variable( YT )
	{
		Name	total_cyclin;
		Value	0.25;
		Fixed	0;
	}
	
	Variable Variable( CT )
	{
		Name	total_cdc2;
		Value	1.0;
		Fixed	0;
	}
	
	
}

System System( /SBMLRule )
{
	Name	"System for SBML Rule";
	StepperID	Default;

	Process ExpressionAssignmentProcess( Assignment_YT )
	{
		StepperID	Default;
		Name	"Assignment rule for 'YT'";
		Expression	"Y.NumberConc + YP.NumberConc + M.NumberConc + pM.NumberConc";
		VariableReferenceList
			[ YT Variable:/cell:YT 1 ]
			[ Y  Variable:/cell:Y  0 ]
			[ YP Variable:/cell:YP 0 ]
			[ M  Variable:/cell:M  0 ]
			[ pM Variable:/cell:pM 0 ];
	}
	
	Process ExpressionAssignmentProcess( Assignment_CT )
	{
		StepperID	Default;
		Name	"Assignment rule for 'CT'";
		Expression	"C2.NumberConc + CP.NumberConc + M.NumberConc + pM.NumberConc";
		VariableReferenceList
			[ CT Variable:/cell:CT 1 ]
			[ C2 Variable:/cell:C2 0 ]
			[ CP Variable:/cell:CP 0 ]
			[ M  Variable:/cell:M  0 ]
			[ pM Variable:/cell:pM 0 ];
	}
	
	
}

