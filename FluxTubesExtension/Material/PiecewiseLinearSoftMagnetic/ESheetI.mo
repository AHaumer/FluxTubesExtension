within FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic;
record ESheetI "E-Sheet I"
  extends BaseData(
    label="E-Sheet I",
    N=4,
    Hk={250, 700, 3500, 16000},
    Bk={1.0, 1.4, 1.59, 1.8});
  annotation (defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>
This is a simple example defining 4 nodes (not included the origin) along the characteric of E-Sheet I.
</p>
</html>"));
end ESheetI;
