within AixLib.DataBase.CHP;
record CHPBaseDataDefinition "Basic CHP data"
extends Modelica.Icons.Record;

  import SI = Modelica.SIunits;
  import SIconv = Modelica.SIunits.Conversions.NonSIunits;

  parameter SI.volume vol[:] "Water volume of CHP";
  parameter Real data_CHP[:,5];
          //Matrix contains : [capacity [Percent], electrical power [kW], total heat recovery [kW], fuel input [kW], fuel consumption [m3/h]]

  parameter SI.Temperature maxTFlow "Maximum flow temperature";
  parameter SI.Temperature maxTReturn "Maximum return temperature";

  parameter SI.Length DPipe "Outlet pipe diameter";

  annotation (Documentation(info="<html>
<p><h4><font color=\"#008000\">Overview</font></h4></p>
<p>Base data record for combined heat and power generators (CHP). </p>
</html>",
        revisions="<html>
<p><ul>
<li><i>June 27, 2013&nbsp;</i> by Ole Odendahl:<br/>Added documentation and formatted appropriately</li>
</ul></p>
</html>"));
end CHPBaseDataDefinition;