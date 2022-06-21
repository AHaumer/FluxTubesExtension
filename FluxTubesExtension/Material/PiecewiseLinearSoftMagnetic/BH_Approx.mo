within FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic;
function BH_Approx "Piecewise linear B(H) interpolation"
  extends Modelica.Icons.Function;

  input Integer N "Count of nodes";
  input SI.MagneticFieldStrength Hk[N] "Field strength coefficients";
  input SI.MagneticFluxDensity Bk[N] "Flux density coefficients";
  input SI.MagneticFieldStrength H "Field strength in ferromagnetic flux tube element";

  output SI.MagneticFluxDensity B "Flux density in ferromagnetic flux tube element";

protected
  Integer k=findInterval(Hk, H);
algorithm
  B := if k<=1 then Bk[1]/Hk[1]*H else
       sign(H)*(Bk[k-1] + (Bk[k] - Bk[k-1])/(Hk[k] - Hk[k-1])*(abs(H) - Hk[k-1]));
  annotation(derivative(zeroDerivative=N, zeroDerivative=Hk, zeroDerivative=Bk)=derBH_Approx);
end BH_Approx;
