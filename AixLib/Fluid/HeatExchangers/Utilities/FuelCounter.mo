within AixLib.Fluid.HeatExchangers.Utilities;
model FuelCounter "Fuel counter monitoring fuel consumption in a boiler model"
  extends Modelica.Icons.TranslationalSensor;
  Modelica.SIunits.Conversions.NonSIunits.Energy_kWh counter;
  Modelica.Blocks.Interfaces.RealInput fuel_in annotation(Placement(transformation(extent = {{-120, -20}, {-80, 20}})));
equation
  der(counter) = fuel_in / 3600 / 1000;
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent=  {{-76, 76}, {76, 42}}, lineColor=  {135, 135, 135}, fillColor=  {0, 0, 255},
            fillPattern=                                                                                                    FillPattern.Solid, textString=  "Fuel Counter")}), Documentation(info = "<html>
 <h4><font color=\"#008000\">Overview</font></h4>
 <p>This fuel counter integrates the actual fuel use to arrive at the overall
    fuel consumption. </p>
 </html>", revisions = "<html>
 <ul>
 <li><i>09.10.2013&nbsp;</i>
    by Marcus Fuchs:<br/>
    corrected error in equation</li>
 <li><i>07.10.2013&nbsp;</i>
    by Marcus Fuchs:<br/>
    implemented</li>
 </ul>
 </html>"));
end FuelCounter;
