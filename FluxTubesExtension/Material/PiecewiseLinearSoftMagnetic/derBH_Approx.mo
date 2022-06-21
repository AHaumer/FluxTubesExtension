within FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic;
function derBH_Approx "Piecewise linear der_B(H) interpolation"
  extends Modelica.Icons.Function;

  input Integer N "Count of nodes";
  input SI.MagneticFieldStrength Hk[N] "Field strength coefficients";
  input SI.MagneticFluxDensity Bk[N] "Flux density coefficients";
  input SI.MagneticFieldStrength H "Field strength in ferromagnetic flux tube element";
  input Real der_H(unit="A/(m.s)") "Derivative of field strength in ferromagnetic flux tube element";

  output Real der_B(unit="T/s") "Derivative of flux density in ferromagnetic flux tube element";

protected
  Integer k=findInterval(Hk, H);
algorithm
  der_B := if k<=1 then Bk[1]/Hk[1]*der_H else
           (Bk[k] - Bk[k-1])/(Hk[k] - Hk[k-1])*der_H;
end derBH_Approx;
