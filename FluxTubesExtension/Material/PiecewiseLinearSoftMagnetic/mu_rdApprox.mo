within FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic;
function mu_rdApprox "Piecewise linear mu_rd(H) interpolation"
  extends Modelica.Icons.Function;
  input FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic.BaseData material
    "Material specific parameter set";
  input SI.MagneticFieldStrength H "Field strength in ferromagnetic flux tube element";
  output SI.RelativePermeability mu_rd  "Differential relative magnetic permeability of ferromagnetic flux tube element";
protected
  Integer k=findInterval(material.Hk, H);
algorithm
  mu_rd := if k<=1 then material.Bk[1]/(mu_0*material.Hk[1]) else
           (material.Bk[k] - material.Bk[k-1])/(mu_0*(material.Hk[k] - material.Hk[k-1]));
end mu_rdApprox;
