within FluxTubesExtension.Material.SimpleSoftMagnetic;
record HotRolled "Hot rolled"
  extends BaseData(
    label="Hot rolled",
    N=4,
    Hk={101.221111, 432.6331569, 2965.149522, 18159.2437},
    Bk={0.852318683, 0.485857233, 0.191866078, 0.505390515});
  annotation (defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>
Please refer to the description of  the enclosing package <a href=\"modelica://FluxTubesExtension.Material.SimpleSoftMagnetic\">SimpleSoftMagnetic</a> for a description of all soft magnetic material characteristics of this package.
</p>
</html>"));
end HotRolled;
