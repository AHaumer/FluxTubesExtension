within FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic;
function BH_Approx "Piecewise linear B(H) interpolation"
  extends Modelica.Icons.Function;
  input FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic.BaseData material
    "Material specific parameter set";
  input SI.MagneticFieldStrength H "Field strength in ferromagnetic flux tube element";
  output SI.MagneticFluxDensity B "Flux density in ferromagnetic flux tube element";
protected
  Integer k=findInterval(material.Hk, H);
algorithm
  B := if k<=1 then material.Bk[1]/material.Hk[1]*H else
       sign(H)*(material.Bk[k-1] + (material.Bk[k] - material.Bk[k-1])/(material.Hk[k] - material.Hk[k-1])*(abs(H) - material.Hk[k-1]));
  annotation(derivative(zeroDerivative=material)=derBH_Approx);
end BH_Approx;
