pushd "%~dp0"
bikeshed --die-on=link-error spec index.bs
popd
