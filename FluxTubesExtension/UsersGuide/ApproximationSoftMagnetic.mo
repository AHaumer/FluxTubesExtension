within FluxTubesExtension.UsersGuide;
class ApproximationSoftMagnetic
  "Approximation of characteristics of soft magnetic material"
  extends Modelica.Icons.Information;

  annotation (Documentation(info="<html>

<p>
After in-depth investigation of literature, three possible approximations seem to be feasible:
</p>

<h4>Approximation according to Roschke <a href=\"modelica://FluxTubesExtension.UsersGuide.Literature\">[Ro00]</a></h4>
<p>
<img src=\"modelica://FluxTubesExtension/Resources/Images/eq_Roschke.png\" alt=\"Approximation acc. to Roschke\">
</p>
<p>
This approximation includes the inflection point, i.e. it is very usefull to describe the virgin characteristic of a material. 
</p>
<p>
However, calculating the parameters used in the approximation formula is a challenging nonlinear optimization problem.
</p>

<h4>Approximation according to Macfadyen et al. <a href=\"modelica://FluxTubesExtension.UsersGuide.Literature\">[Ma73]</a></h4>
<p>
<img src=\"modelica://FluxTubesExtension/Resources/Images/eq_Macfadyen.png\" alt=\"Approximation acc. to Macfayden\">
</p>
<p>
This approximation neglects the inflection point, i.e. it is suitable to describe the center line of the (narrow) hysteresis loops of a soft magnetic material. 
</p>
<p>
Calculating the parameters used in the approximation formula is a nonlinear optimization problem but much easier to solve. 
</p>
<p>
Since the approximation formula describes the characteristic of magnetic flux density B dependent on magnetic field strength H, 
and in many cases the derivative of B is needed to calculate induced voltage, it is recommended to describe the derivative dB/dH additionally.
</p>

<h4>Approximation using a piecewise linear interpolation</h4>
<p>
<img src=\"modelica://FluxTubesExtension/Resources/Images/eq_LinearInterpolation.png\" alt=\"Approximation using piecewise linear interpolation\">
</p>
<p>
This approximation is mainly intended to describe roughly magnetization characteristic for educational purposes. 
It is sufficient to specify several points Bk(Hk) along the original characteristic. 
Especially for designing exam questions, it is easier to calculate the intersection between a linear interpolation segment and the linear charcteristic of a magnetic source 
than to determine the intersection between an nonlinar characteristic and the linear charcteristic of a magnetic source graphically.
</p>
<p>
Since the approximation formula describes the characteristic of magnetic flux density B dependent on magnetic field strength H, 
and in many cases the derivative of B is needed to calculate induced voltage, it is recommended to describe the derivative dB/dH additionally.
</p>

</html>"));
end ApproximationSoftMagnetic;
