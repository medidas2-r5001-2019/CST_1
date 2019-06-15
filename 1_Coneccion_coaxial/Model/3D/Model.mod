'# MWS Version: Version 2017.1 - Feb 24 2017 - ACIS 26.0.1 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 0.0 fmax = 33
'# created = '[VERSION]2017.1|26.0.1|20170224[/VERSION]


'@ use template: Coaxial (TEM) Connector & Transition.cfg

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
'set the units
With Units
    .Geometry "mm"
    .Frequency "GHz"
    .Voltage "V"
    .Resistance "Ohm"
    .Inductance "NanoH"
    .TemperatureUnit  "Kelvin"
    .Time "ns"
    .Current "A"
    .Conductance "Siemens"
    .Capacitance "PikoF"
End With

'----------------------------------------------------------------------------

Plot.DrawBox True

With Background
     .Type "PEC"
     .XminSpace "0.0"
     .XmaxSpace "0.0"
     .YminSpace "0.0"
     .YmaxSpace "0.0"
     .ZminSpace "0.0"
     .ZmaxSpace "0.0"
End With

With Boundary
     .Xmin "electric"
     .Xmax "electric"
     .Ymin "electric"
     .Ymax "electric"
     .Zmin "electric"
     .Zmax "electric"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
End With

With MeshSettings
     .SetMeshType "HexTLM"
     .Set "StepsPerWaveNear", "20"
     .Set "StepsPerBoxNear", "10"
     .Set "StepsPerWaveFar", "20"
     .Set "StepsPerBoxFar", "10"
     .Set "RatioLimitGeometry", "20"
End With

' increase solver accuracy (non resonant structure)

With Solver
     .SteadyStateLimit "-40"
End With

Solver.TDRComputation "True"

'----------------------------------------------------------------------------

With MeshSettings
     .SetMeshType "Hex"
     .Set "Version", 1%
End With

With Mesh
     .MeshType "PBA"
End With

'set the solver type
ChangeSolverType("HF Time Domain")



'@ new component: component1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Component.New "component1" 


'@ define cylinder: component1:solid1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Vacuum" 
     .OuterRadius "9" 
     .InnerRadius "7" 
     .Axis "z" 
     .Zrange "0", "8" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With 


'@ delete shape: component1:solid1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solid.Delete "component1:solid1" 


'@ define cylinder: component1:solid1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "PEC" 
     .OuterRadius "b/2 +1" 
     .InnerRadius "b/2" 
     .Axis "z" 
     .Zrange "0", "20" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With 


'@ define cylinder: component1:solid2

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid2" 
     .Component "component1" 
     .Material "PEC" 
     .OuterRadius "a/2" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "0", "20" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With 


'@ define cylinder: component1:solid3

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid3" 
     .Component "component1" 
     .Material "PEC" 
     .OuterRadius "a/2" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "-g", "-l" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With 


'@ define cylinder: component1:solid4

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid4" 
     .Component "component1" 
     .Material "PEC" 
     .OuterRadius "b/2 +1" 
     .InnerRadius "b/2" 
     .Axis "z" 
     .Zrange "0", "-l" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With 


'@ define cylinder: component1:solid5

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid5" 
     .Component "component1" 
     .Material "PEC" 
     .OuterRadius "0.927/2" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "0", "-g" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With 


'@ switch working plane

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Plot.DrawWorkplane "true" 


'@ pick face

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Pick.PickFaceFromId "component1:solid2", "3" 


'@ define port: 1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Port 
     .Reset 
     .PortNumber "1" 
     .Label "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Full" 
     .Orientation "zmax" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-2.75", "2.75" 
     .Yrange "-2.75", "2.75" 
     .Zrange "20", "20" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With 


'@ pick face

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Pick.PickFaceFromId "component1:solid3", "1" 


'@ define port: 2

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Port 
     .Reset 
     .PortNumber "2" 
     .Label "" 
     .NumberOfModes "1" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Full" 
     .Orientation "zmin" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-2.75", "2.75" 
     .Yrange "-2.75", "2.75" 
     .Zrange "-20", "-20" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With 


'@ define frequency range

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solver.FrequencyRange "0.0", "33" 


'@ define background

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Background 
     .ResetBackground 
     .XminSpace "0.0" 
     .XmaxSpace "0.0" 
     .YminSpace "0.0" 
     .YmaxSpace "0.0" 
     .ZminSpace "0.0" 
     .ZmaxSpace "0.0" 
     .ApplyInAllDirections "False" 
End With 

With Material 
     .Reset 
     .FrqType "all"
     .Type "Normal"
     .MaterialUnit "Frequency", "Hz"
     .MaterialUnit "Geometry", "m"
     .MaterialUnit "Time", "s"
     .MaterialUnit "Temperature", "Kelvin"
     .Epsilon "1"
     .Mu "1"
     .Sigma "0.0"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstSigma"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstSigma"
     .EnableUserConstTanDModelOrderMu "False"
     .ConstTanDModelOrderMu "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMu "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMu "Nth Order"
     .MaximalOrderNthModelFitMu "10"
     .ErrorLimitNthModelFitMu "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMu "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMu "False"
     .NonlinearMeasurementError "1e-1"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Rho "0"
     .ThermalType "Normal"
     .ThermalConductivity "0"
     .HeatCapacity "0"
     .DynamicViscosity "0"
     .Emissivity "0"
     .MetabolicRate "0"
     .BloodFlow "0"
     .VoxelConvection "0"
     .MechanicsType "Unused"
     .Colour "0.6", "0.6", "0.6" 
     .Wireframe "False" 
     .Reflection "False" 
     .Allowoutline "True" 
     .Transparentoutline "False" 
     .Transparency "0" 
     .ChangeBackgroundMaterial
End With 


'@ define time domain solver parameters

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Mesh.SetCreator "High Frequency" 

With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-40"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With


'@ set parametersweep options

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
    .SetSimulationType "Transient" 
End With 


'@ add parsweep sequence: Sequence 1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddSequence "Sequence 1" 
End With


'@ add parsweep parameter: Sequence 1:g

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With ParameterSweep
     .AddParameter_Linear "Sequence 1", "g", "0.025", "1", "3" 
End With


