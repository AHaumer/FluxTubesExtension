within FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic;
function mu_rApprox "Piecewise linear mu_r(H) interpolation"
  extends Modelica.Icons.Function;
  input FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic.BaseData material
    "Material specific parameter set";
  input SI.MagneticFieldStrength H "Field strength in ferromagnetic flux tube element";
  output SI.RelativePermeability mu_r "Relative magnetic permeability of ferromagnetic flux tube element";
protected
  Integer k=findInterval(material.Hk, H);
algorithm
  mu_r := if k<=1 then material.Bk[1]/(mu_0*material.Hk[1]) else
          (material.Bk[k-1] + (material.Bk[k] - material.Bk[k-1])/(material.Hk[k] - material.Hk[k-1])*(abs(H) - material.Hk[k-1]))/(mu_0*abs(H));
end mu_rApprox;
