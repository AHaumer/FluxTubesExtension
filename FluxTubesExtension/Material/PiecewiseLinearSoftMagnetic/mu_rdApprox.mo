within FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic;
function mu_rdApprox "Piecewise linear mu_rd(H) interpolation"
  extends Modelica.Icons.Function;

  input Integer N "Count of nodes";
  input SI.MagneticFieldStrength Hk[N] "Field strength coefficients";
  input SI.MagneticFluxDensity Bk[N] "Flux density coefficients";
  input SI.MagneticFieldStrength H "Field strength in ferromagnetic flux tube element";

  output SI.RelativePermeability mu_rd  "Differential relative magnetic permeability of ferromagnetic flux tube element";

protected
  Integer k=findInterval(Hk, H);
algorithm
  mu_rd := if k<=1 then Bk[1]/(mu_0*Hk[1]) else
           (Bk[k] - Bk[k-1])/(mu_0*(Hk[k] - Hk[k-1]));
end mu_rdApprox;
