within AixLib.Fluid.HeatGenerators.BaseClasses.Controllers;
model PIcontroller

  parameter Real K_c=0 "Gain of the controller";
  parameter Modelica.SIunits.Time T_c=1 "Time Constant (T>0 required)";
  parameter Real minYControl = 25 "Minimum controller output in load operation";

  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-70,0},{-50,20}})));
  Modelica.Blocks.Continuous.LimPID PI(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    yMax=100,
    k=K_c,
    Ti=T_c,
    yMin=minYControl,
    y_start=0) annotation (Placement(transformation(
          extent={{-36,34},{-16,54}})));
  Modelica.Blocks.Continuous.LimPID PI1(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    yMax=100,
    k=K_c,
    Ti=T_c,
    yMin=0) annotation (Placement(transformation(extent={
            {-12,72},{8,92}})));
  Modelica.Blocks.Discrete.TriggeredSampler triggeredSampler(y_start=0)
    annotation (Placement(transformation(extent={{-42,74},
            {-26,90}})));
  Modelica.Blocks.Discrete.TriggeredSampler triggeredSampler2(y_start=0)
    annotation (Placement(transformation(extent={{-64,36},
            {-48,52}})));
  Modelica.Blocks.Logical.TriggeredTrapezoid triggeredTrapezoid(rising=100)
    annotation (Placement(transformation(extent={{-28,
            -22},{-10,-6}})));
  Modelica.Blocks.Logical.Switch switch3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={20,24})));
  Modelica.Blocks.Math.Product product annotation (
      Placement(transformation(extent={{30,-18},{50,2}})));
  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (
      Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput setpoint annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.BooleanInput ON
                                   "Connector of Boolean input signal"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Logical.Not not1
    annotation (Placement(transformation(extent={{-66,-70},{-46,-50}})));
  Modelica.Blocks.Interfaces.RealInput measurement
    "Connector of second Real input signal" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
equation

  connect(switch1.y, PI.u_m)
    annotation (Line(points={{-49,10},{-26,10},{-26,32}}, color={0,0,127}));
  connect(PI1.u_m, PI.u_m) annotation (Line(points={{-2,70},{-2,10},{-26,10},{-26,
          32}}, color={0,0,127}));
  connect(triggeredSampler.y, PI1.u_s)
    annotation (Line(points={{-25.2,82},{-14,82}}, color={0,0,127}));
  connect(triggeredSampler2.y, PI.u_s)
    annotation (Line(points={{-47.2,44},{-38,44}}, color={0,0,127}));
  connect(PI.y, switch3.u3)
    annotation (Line(points={{-15,44},{12,44},{12,36}}, color={0,0,127}));
  connect(PI1.y, switch3.u1)
    annotation (Line(points={{9,82},{28,82},{28,36}}, color={0,0,127}));
  connect(product.u1, switch3.y)
    annotation (Line(points={{28,-2},{20,-2},{20,13}}, color={0,0,127}));
  connect(product.u2, triggeredTrapezoid.y) annotation (Line(points={{28,-14},{-9.1,
          -14},{-9.1,-14}}, color={0,0,127}));
  connect(product.y, switch2.u3)
    annotation (Line(points={{51,-8},{68,-8},{68,-8}}, color={0,0,127}));
  connect(switch2.u1, switch3.y)
    annotation (Line(points={{68,8},{20,8},{20,13}}, color={0,0,127}));
  connect(switch2.y, y)
    annotation (Line(points={{91,0},{110,0},{110,0}}, color={0,0,127}));
  connect(triggeredSampler2.trigger, triggeredTrapezoid.u) annotation (Line(
        points={{-56,34.56},{-56,32},{-38,32},{-38,-14},{-29.8,-14}}, color={255,
          0,255}));
  connect(switch2.u2, triggeredTrapezoid.u) annotation (Line(points={{68,0},{60,
          0},{60,-60},{-38,-60},{-38,-14},{-29.8,-14}}, color={255,0,255}));
  connect(setpoint, triggeredSampler.u) annotation (Line(points={{-120,60},{-80,
          60},{-80,82},{-43.6,82}}, color={0,0,127}));
  connect(triggeredSampler2.u, triggeredSampler.u) annotation (Line(points={{-65.6,
          44},{-80,44},{-80,82},{-43.6,82}}, color={0,0,127}));
  connect(switch1.u1, triggeredSampler.u) annotation (Line(points={{-72,18},{-80,
          18},{-80,82},{-43.6,82}}, color={0,0,127}));
  connect(switch3.u2, triggeredSampler.trigger) annotation (Line(points={{20,36},
          {20,64},{-34,64},{-34,72.56}}, color={255,0,255}));
  connect(ON, switch1.u2) annotation (Line(points={{-120,-60},{-82,-60},{-82,10},
          {-72,10}}, color={255,0,255}));
  connect(triggeredSampler.trigger, switch1.u2) annotation (Line(points={{-34,72.56},
          {-34,64},{-82,64},{-82,10},{-72,10}}, color={255,0,255}));
  connect(not1.y, triggeredTrapezoid.u) annotation (Line(points={{-45,-60},{-38,
          -60},{-38,-14},{-29.8,-14}}, color={255,0,255}));
  connect(not1.u, switch1.u2) annotation (Line(points={{-68,-60},{-82,-60},{-82,
          10},{-72,10}}, color={255,0,255}));
  connect(switch1.u3, measurement) annotation (Line(points={{-72,2},{-78,2},{-78,
          -80},{0,-80},{0,-120}}, color={0,0,127}));
  annotation (         Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255}), Text(
          extent={{-78,32},{74,-28}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="PI Controller")}),
    Documentation(info="<html>
<p><h4><font color=\"#008000\">Overview</font></h4></p>
<p>This is model consists of two PI controllers to control the system both when in operation as well as when shuttind down.</p>
<p><h4><font color=\"#008000\">Level of Development</font></h4></p>
<p><img src=\"modelica://HVAC/Images/stars2.png\"/></p>
<p><h4><font color=\"#008000\">Concept</font></h4></p>
<p>Because changing the controller signal from a certain value to zero is not continuous it will result in unstabilities in the simulation. Therefore, two controllers are implemented. One for the operation as a normal controller and one that change the output signal smoothly from the output of the other controller to zero.</p>
</html>",
revisions="<html>
<p><ul>
<li><i>January 23, 2014&nbsp;</i> by Pooyan Jahangiri:<br/>Formatted documentation appropriately</li>
<li><i>January 31, 2011</i> by Pooyan Jahangiri:<br/>Implemented</li>
</ul></p>
</html>"));
end PIcontroller;