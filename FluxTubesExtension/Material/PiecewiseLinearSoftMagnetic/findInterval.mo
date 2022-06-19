within FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic;
function findInterval "Find interval for piecewise linear interpolation"
  extends Modelica.Icons.Function;
  input SI.MagneticFieldStrength Xk[:] "Nodes";
  input SI.MagneticFieldStrength x "Value to find interval";
  output Integer k "Interval Xk[k-1]..Xk[k]";
protected
  Integer n=size(Xk, 1);
algorithm
  k:=1;
  while abs(x)>=Xk[k] loop
    k:=k+1;
    if k>n then
      k:=n;
      break;
    end if;
  end while;
end findInterval;
