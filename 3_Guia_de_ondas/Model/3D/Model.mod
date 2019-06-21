'# MWS Version: Version 2017.1 - Feb 24 2017 - ACIS 26.0.1 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 0 fmax = 15
'# created = '[VERSION]2017.1|26.0.1|20170224[/VERSION]


'@ use template: Waveguide Coupler & Divider.cfg

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
With Background
     .Type "pec"
     .XminSpace "0.0"
     .XmaxSpace "0.0"
     .YminSpace "0.0"
     .YmaxSpace "0.0"
     .ZminSpace "0.0"
     .ZmaxSpace "0.0"
End With
' set boundary conditions to electric
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
Mesh.MinimumCurvatureRefinement "150"
With MeshSettings
     .SetMeshType "HexTLM"
     .Set "StepsPerWaveNear", "20"
     .Set "StepsPerBoxNear", "10"
     .Set "StepsPerWaveFar", "20"
     .Set "StepsPerBoxFar", "10"
     .Set "RatioLimitGeometry", "15"
End With
'----------------------------------------------------------------------------
'set the frequency range
Solver.FrequencyRange "0", "15"
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

'@ define brick: component1:solid1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "-g_a/2", "g_a/2" 
     .Yrange "-g_b/2", "g_b/2" 
     .Zrange "0", "g_l+1" 
     .Create
End With

'@ pick face

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Pick.PickFaceFromId "component1:solid1", "1"

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
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-11.43", "11.43" 
     .Yrange "-5.08", "5.08" 
     .Zrange "40", "40" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With

'@ pick face

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Pick.PickFaceFromId "component1:solid1", "2"

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
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-11.43", "11.43" 
     .Yrange "-5.08", "5.08" 
     .Zrange "0", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Create 
End With

'@ modify port: 1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "1" 
     .Label "" 
     .NumberOfModes "3" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-11.43", "11.43" 
     .Yrange "-5.08", "5.08" 
     .Zrange "40", "40" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Shield "none" 
     .Modify 
End With

'@ modify port: 2

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Port 
     .Reset 
     .LoadContentForModify "2" 
     .Label "" 
     .NumberOfModes "3" 
     .AdjustPolarization "False" 
     .PolarizationAngle "0.0" 
     .ReferencePlaneDistance "0" 
     .TextSize "50" 
     .TextMaxLimit "0" 
     .Coordinates "Picks" 
     .Orientation "positive" 
     .PortOnBound "True" 
     .ClipPickedPortToBound "False" 
     .Xrange "-11.43", "11.43" 
     .Yrange "-5.08", "5.08" 
     .Zrange "0", "0" 
     .XrangeAdd "0.0", "0.0" 
     .YrangeAdd "0.0", "0.0" 
     .ZrangeAdd "0.0", "0.0" 
     .SingleEnded "False" 
     .Shield "none" 
     .Modify 
End With

'@ define monitor: e-field (f=10)

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=10)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .Frequency "10" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-11.43", "11.43", "-5.08", "5.08", "0", "40" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .Create 
End With

'@ define monitor: h-field (f=10)

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=10)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .Frequency "10" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-11.43", "11.43", "-5.08", "5.08", "0", "40" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .Create 
End With

'@ define monitor: e-field (f=13.5)

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=13.5)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .Frequency "13.5" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-11.43", "11.43", "-5.08", "5.08", "0", "40" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .Create 
End With

'@ define monitor: h-field (f=13.5)

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=13.5)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .Frequency "13.5" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-11.43", "11.43", "-5.08", "5.08", "0", "40" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .Create 
End With

'@ define monitor: e-field (f=15)

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Monitor 
     .Reset 
     .Name "e-field (f=15)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Efield" 
     .Frequency "15" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-11.43", "11.43", "-5.08", "5.08", "0", "40" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .Create 
End With

'@ define monitor: h-field (f=15)

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Monitor 
     .Reset 
     .Name "h-field (f=15)" 
     .Dimension "Volume" 
     .Domain "Frequency" 
     .FieldType "Hfield" 
     .Frequency "15" 
     .UseSubvolume "False" 
     .Coordinates "Structure" 
     .SetSubvolume "-11.43", "11.43", "-5.08", "5.08", "0", "40" 
     .SetSubvolumeOffset "0.0", "0.0", "0.0", "0.0", "0.0", "0.0" 
     .Create 
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

'@ new component: component2

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Component.New "component2"

'@ define brick: component2:solid2

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Brick
     .Reset 
     .Name "solid2" 
     .Component "component2" 
     .Material "PEC" 
     .Xrange "(-g_a/2)-4", "(g_a/2)+4" 
     .Yrange "(-g_b/2)-4", "(g_b/2)+4" 
     .Zrange "0", "g_l" 
     .Create
End With

'@ change component: component2:solid2 to: component1:solid2

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solid.ChangeComponent "component2:solid2", "component1"

'@ delete component: component2

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Component.Delete "component2"

'@ define cylinder: component1:solid3

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid3" 
     .Component "component1" 
     .Material "PEC" 
     .OuterRadius "c_a/2" 
     .InnerRadius "c_b/2" 
     .Axis "y" 
     .Yrange "g_b/2", "c_l" 
     .Xcenter "0" 
     .Zcenter "11" 
     .Segments "0" 
     .Create 
End With

'@ paste structure data: 1

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With SAT 
     .Reset 
     .FileName "*1.cby" 
     .SubProjectScaleFactor "0.001" 
     .ImportToActiveCoordinateSystem "True" 
     .ScaleToUnit "True" 
     .Curves "False" 
     .Read 
End With

'@ rename block: component1:solid3_1 to: component1:solid4

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solid.Rename "component1:solid3_1", "solid4"

'@ split shape: component1:solid4

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solid.SplitShape "solid4", "component1"

'@ delete shape: component1:solid4

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solid.Delete "component1:solid4"

'@ define cylinder: component1:solid4

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid4" 
     .Component "component1" 
     .Material "PEC" 
     .OuterRadius "c_g/2" 
     .InnerRadius "0.0" 
     .Axis "y" 
     .Yrange "g_b/2", "c_l" 
     .Xcenter "0" 
     .Zcenter "11" 
     .Segments "0" 
     .Create 
End With

'@ define cylinder: component1:solid5

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid5" 
     .Component "component1" 
     .Material "Vacuum" 
     .OuterRadius "c_b/2+1" 
     .InnerRadius "c_g/2" 
     .Axis "y" 
     .Yrange "g_b/2", "c_l+1" 
     .Xcenter "0" 
     .Zcenter "11" 
     .Segments "0" 
     .Create 
End With 


'@ boolean insert shapes: component1:solid2, component1:solid5

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solid.Insert "component1:solid2", "component1:solid5"

'@ rename block: component1:solid5 to: component1:VACIO_COAX

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solid.Rename "component1:solid5", "VACIO_COAX"

'@ rename block: component1:solid4 to: component1:COAX_INTERNO

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solid.Rename "component1:solid4", "COAX_INTERNO"

'@ rename block: component1:solid3 to: component1:COAX_EXTERNO

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solid.Rename "component1:solid3", "COAX_EXTERNO"

'@ rename block: component1:solid1 to: component1:VACIO_GUIA

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solid.Rename "component1:solid1", "VACIO_GUIA"

'@ rename block: component1:solid2 to: component1:COND_GUIA

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solid.Rename "component1:solid2", "COND_GUIA"

'@ rename block: component1:VACIO_GUIA to: component1:GUIA_VACIO

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solid.Rename "component1:VACIO_GUIA", "GUIA_VACIO"

'@ rename block: component1:COND_GUIA to: component1:GUIA_COND

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solid.Rename "component1:COND_GUIA", "GUIA_COND"

'@ rename block: component1:VACIO_COAX to: component1:COAX_VACIO

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solid.Rename "component1:VACIO_COAX", "COAX_VACIO"

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

'@ delete shape: component1:COAX_VACIO

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
Solid.Delete "component1:COAX_VACIO" 


'@ define cylinder: component1:COAX_VACIO

'[VERSION]2017.1|26.0.1|20170224[/VERSION]
With Cylinder 
     .Reset 
     .Name "COAX_VACIO" 
     .Component "component1" 
     .Material "Vacuum" 
     .OuterRadius "c_b/2" 
     .InnerRadius "c_g/2" 
     .Axis "y" 
     .Yrange "g_b/2", "c_l+1" 
     .Xcenter "0" 
     .Zcenter "11" 
     .Segments "0" 
     .Create 
End With 


