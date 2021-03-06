within AixLib.DataBase.Walls;
record WallBaseDataDefinition "Wall base data definition"
  extends Modelica.Icons.Record;
  // pma 2010-04-28: REMOVED THE BASE DEFINITIONS to get errors thrown when using unparameterised wall models
  parameter Integer n(min = 1) = 3 "Number of wall layers" annotation(Dialog(tab = "Wall 1", group = "Wall 1 parameters"));
  parameter Modelica.SIunits.Length d[n] "Thickness of wall layers" annotation(Dialog(tab = "Wall 1", group = "Layer 1 parameters"));
  parameter Modelica.SIunits.Density rho[n] "Density of wall layers" annotation(Dialog(tab = "Wall 1", group = "Layer 1 parameters"));
  parameter Modelica.SIunits.ThermalConductivity lambda[n]
    "Thermal conductivity of wall layers"                                                        annotation(Dialog(tab = "Wall 1", group = "Wall 1 parameters"));
  parameter Modelica.SIunits.SpecificHeatCapacity c[n]
    "Specific heat capacity of wall layers"                                                    annotation(Dialog(tab = "Wall 1", group = "Wall 1 parameters"));
  parameter Modelica.SIunits.Emissivity eps = 0.95
    "Emissivity of inner wall surface"                                                annotation(Dialog(tab = "Wall 1", group = "Wall 1 parameters"));
  annotation(Documentation(info = "<html>
 <h4><font color=\"#008000\">Overview</font></h4>
 <p>Wall BaseDataDefinition actually doesn&apos;t need predefined values and that is desirable to get errors thrown when using an unparameterised wall in a model. </p>
 <h4><font color=\"#008000\">Level of Development</font></h4>
 <p><img src=\"modelica://AixLib/Resources/Images/Stars/stars3.png\" alt=\"stars: 3 out of 5\"/></p>
 <h4><font color=\"#008000\">Concept</font></h4>
 <p><b><font style=\"color: #ff0000; \">Attention:</font></b> The first element in each vector represents the layer connected to <code>port_a</code>(outside), the last element represents the layer connected to <code>port_b</code>(surface facing the room). </p>
 <h4><font color=\"#008000\">References</font></h4>
 <p>Base data definition for record to be used in model <a href=\"Building.Components.Walls.BaseClasses.ConvNLayerClearanceStar\">Building.Components.Walls.BaseClasses.ConvNLayerClearanceStar</a></p>
 </html>", revisions = "<html>
 <ul>
 <li><i>September 3, 2013&nbsp;</i> by Ole Odendahl:<br/>Formatted documentation appropriately</li>
 </ul>
 </html>"));
end WallBaseDataDefinition;
