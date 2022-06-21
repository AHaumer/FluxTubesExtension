within FluxTubesExtension.Examples;
model ToroidalCoreAirgap "Educational example: iron core with airgap"
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter SI.Length r=0.15 "Middle radius of iron core";
  parameter SI.Length d=0.02 "Diameter of cylindrical cross section";
  parameter SI.RelativePermeability mu_r=material.mu_i
    "Relative permeability of core";
  parameter SI.Length delta=0.001 "Length of airgap";
  parameter SI.Angle alpha=(1 - delta/(2*pi*r))*2*pi
    "Section angle of toroidal core";
  parameter Integer N=500 "Number of exciting coil turns";
  parameter SI.Current I=3 "Maximum exciting current";
  Modelica.Magnetic.FluxTubes.Basic.ElectroMagneticConverter excitingCoil(N=N)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  FixedShape.Toroid core(
    nonLinearPermeability=true,
    mu_rConst=mu_r,
    material=material,
    r=r,
    d=d,
    alpha=alpha) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          origin={0,30})));
  Modelica.Magnetic.FluxTubes.Shapes.FixedShape.Toroid airGap(
    nonLinearPermeability=false,
    mu_rConst=1,
    r=r,
    d=d,
    alpha=2*pi - alpha) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,-50})));
  Modelica.Magnetic.FluxTubes.Basic.ElectroMagneticConverter measuringCoil(N=1)
    annotation (Placement(transformation(extent={{40,-10},{20,10}})));
  Modelica.Magnetic.FluxTubes.Basic.Ground magneticGround
    annotation (Placement(transformation(extent={{-30,-70},{-10,-50}})));
  Modelica.Electrical.Analog.Basic.Ground electricGround1
    annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
  Modelica.Electrical.Analog.Sources.RampCurrent rampCurrent(
    I=I,
    duration=0.015,
    startTime=0.01) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,0})));
  Modelica.Magnetic.FluxTubes.Sensors.MagneticFluxSensor magFluxSensor
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-20,-30})));
  Modelica.Electrical.Analog.Basic.Ground electricGround2
    annotation (Placement(transformation(extent={{40,-30},{60,-10}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={60,0})));
  parameter Material.PiecewiseLinearSoftMagnetic.BaseData material(
    N=2,
    Hk={300,1600},
    Bk={1.2,1.4})
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));
equation
  connect(core.port_n, measuringCoil.port_p)
    annotation (Line(points={{10,30},{20,30},{20,10}}, color={255,127,0}));
  connect(measuringCoil.port_n, airGap.port_p)
    annotation (Line(points={{20,-10},{20,-50},{10,-50}},
                                                 color={255,127,0}));
  connect(electricGround1.p, excitingCoil.n)
    annotation (Line(points={{-50,-10},{-40,-10}}, color={0,0,255}));
  connect(rampCurrent.p, electricGround1.p)
    annotation (Line(points={{-60,-10},{-50,-10}}, color={0,0,255}));
  connect(rampCurrent.n, excitingCoil.p)
    annotation (Line(points={{-60,10},{-40,10}}, color={0,0,255}));
  connect(measuringCoil.n, electricGround2.p)
    annotation (Line(points={{40,-10},{50,-10}}, color={0,0,255}));
  connect(measuringCoil.p, voltageSensor.p)
    annotation (Line(points={{40,10},{60,10}}, color={0,0,255}));
  connect(electricGround2.p, voltageSensor.n)
    annotation (Line(points={{50,-10},{60,-10}}, color={0,0,255}));
  connect(excitingCoil.port_n, magFluxSensor.port_n)
    annotation (Line(points={{-20,-10},{-20,-20}}, color={255,127,0}));
  connect(magFluxSensor.port_p, magneticGround.port)
    annotation (Line(points={{-20,-40},{-20,-50}}, color={255,127,0}));
  connect(magneticGround.port, airGap.port_n)
    annotation (Line(points={{-20,-50},{-10,-50}}, color={255,127,0}));
  connect(excitingCoil.port_p, core.port_p)
    annotation (Line(points={{-20,10},{-20,30},{-10,30}}, color={255,127,0}));
  annotation (Documentation(info="<html>
<p>
Educational example of a magnetic circuit containing a toroidal iron core with circular cross section and an airgap:
</p>
<p>
A current ramp is applied in positive electric direction through the exciting coil, causing a rising magnetomotive force (mmf) in positive magnetic direction of the electromagnetic converter.
The mmf in turn causes a magnetic flux through the circuit in the direction indicated by the flux sensor.
From that magnetic flux, flux density can be calculated in every element of the magnetic circuit. Flux density is used to derive magnetic field strength.
Magnetic field strength times length of the flux line gives magnetic potential difference of each element.
The sum of all magnetic potential differences is covered by the mmf of the exciting coil.
</p>
<p>
Using the values shown in section Parameters, the results can be validated easily by analytic calculations:
</p>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
<tr><th>element   </th><th>cross section     </th><th>length              </th><th>rel. permeability </th><th>B                   </th><th>H                                    </th><th>mmf              </th></tr>
<tr><td>core      </td><td>d<sup>2</sup>*pi/4</td><td>r*alpha             </td><td>&mu;<sub>r</sub>  </td><td>flux / cross section</td><td>B/(&mu;<sub>r</sub>*&mu;<sub>0</sub>)</td><td>H*length         </td></tr>
<tr><td>airgap    </td><td>d<sup>2</sup>*pi/4</td><td>delta=r*(2*pi-alpha)</td><td>1                 </td><td>flux / cross section</td><td>B/(&mu;<sub>0</sub>)</td><td>H*delta </td></tr>
<tr><td>total     </td><td>                  </td><td>                    </td><td>                  </td><td>                    </td><td>                                     </td><td>&Sigma; mmf = N*I</td></tr>
</table>
<p>
Note that since no leakage is present, the magnetic flux is the same in every element - they are connected in series.
For calculation of the length of flux lines, a flux line in the middle of the toroid is used.
</p>
<p>
Additionally, a measuring coil is placed in the airgap.
Due to Faraday's law, the time derivative of flux causes an induced voltage both in the exciting coil (in positive direction) and in the measuring coil (in negative direction).
Since current is given as a linear-time dependent ramp, the induced voltages during that ramp are constant and otherwise zero.
Note that usage of nonlinear magnetic material would change that result due the nonlinear relationship between magnetic field strength and flux density.
</p>
<p>
Note the proper usage of electric and magnetic grounds to define zero potential.
</p>
<h4>Extension: Influence of saturation</h4>
<p>
After simulating the example with constant permeability of the core (core.nonLinearPermeability=false), 
this result can be compared with the result taking saturation of the core (core.nonLinearPermeability=true) into account. 
The initial permeability of the core is the same in both cases, but saturation is demonstrated with the following piecewise linear characteristic defined in the parameter record named material:
</p>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
<tr><th>H / A/m</th><th>B / T</th></tr>
<tr><td> 0     </td><td>0.00 </td></tr>
<tr><td>300    </td><td>1.20 </td></tr>
<tr><td>1600   </td><td>1.40 </td></tr>
</table>
<p>
Taking saturation into account the point of operation can be ontained by the following procedure:
</p>
<ul>
<li>scaling the axes of the material's magnetic characteristic: phi=B*A and mmf=H*l</li>
<li>calculating the parameters of the magnetic source: 
    <ul>
    <li>magnetic no-load potential difference V<sub>m0</sub> = N*I</li>
    <li>magnetic conductance of the (linear) airgap G<sub>m</sub> = &mu;<sub>0</sub>*A/l</li>
    <li>magnetic short-circuit flux phi<sub>sc</sub> =  V<sub>m0</sub>*G<sub>m</sub></li>
    </ul>
<li>intersection between the magnetic characteristic of the material with the characteristic of the source</li>
</ul>
<div>
<img src=\"modelica://FluxTubesExtension/Resources/Images/ToroidalCoreAirgap.png\" alt=\"Toroidal core with airgap\"><br>
</div>
</html>"), experiment(StopTime=0.05, Interval=0.0001));
end ToroidalCoreAirgap;
