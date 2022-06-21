within FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic;
function mu_rApprox "Piecewise linear mu_r(H) interpolation"
  extends Modelica.Icons.Function;

  input Integer N "Count of nodes";
  input SI.MagneticFieldStrength Hk[N] "Field strength coefficients";
  input SI.MagneticFluxDensity Bk[N] "Flux density coefficients";
  input SI.MagneticFieldStrength H "Field strength in ferromagnetic flux tube element";

  output SI.RelativePermeability mu_r "Relative magnetic permeability of ferromagnetic flux tube element";

protected
  Integer k=findInterval(Hk, H);
algorithm
  mu_r := if k<=1 then Bk[1]/(mu_0*Hk[1]) else
          (Bk[k-1] + (Bk[k] - Bk[k-1])/(Hk[k] - Hk[k-1])*(abs(H) - Hk[k-1]))/(mu_0*abs(H));
end mu_rApprox;
