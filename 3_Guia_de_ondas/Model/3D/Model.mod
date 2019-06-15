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
     .Xrange "-a/2", "a/2" 
     .Yrange "-b/2", "b/2" 
     .Zrange "0", "l" 
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


