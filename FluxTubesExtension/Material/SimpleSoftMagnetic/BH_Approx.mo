within FluxTubesExtension.Material.SimpleSoftMagnetic;
function BH_Approx
  "Approximation of B(H) for simple soft magnetic materials"
  extends Modelica.Icons.Function;

  input Integer N "Count of exponential summands";
  input SI.MagneticFieldStrength Hk[N] "Field strength coefficients";
  input SI.MagneticFluxDensity Bk[N] "Flux density coefficients";
  input SI.MagneticFieldStrength H
      "Field strength in ferromagnetic flux tube element";

  output SI.MagneticFluxDensity B
      "Flux density in ferromagnetic flux tube element";

algorithm
  B := mu_0*H + sign(H)*sum({Bk[k]*(1 - exp(-abs(H)/Hk[k])) for k in 1:N});
  annotation (derivative(zeroDerivative=N, zeroDerivative=Hk, zeroDerivative=Bk)=derBH_Approx,
    Documentation(info="<html>
<p>
The magnetic flux density B as a function of magnetic field strength H for all soft magnetic materials currently included in this library is approximated with the following function <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ma73]</a>:
</p>

<div>
<img src=\"modelica://FluxTubesExtension/Resources/Images/eq_Macfadyen.png\" alt=\"Equation for approximation B(H)\"/>
</div>

</html>"));
end BH_Approx;
