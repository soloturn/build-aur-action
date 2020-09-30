# build-aur-action
The action uses ubuntu to run the latest arch linux docker
image, install [yay](https://github.com/Jguer/yay) into it,
then build the package specified.

## Example usage
```yaml
uses: soloturn/build-aur-action@master
with:
  repo-name: qv2ray-dev-git
```

## Inputs
### `repo-name`
**Required** The name of the AUR repo to build. Default `"qv2ray-dev-git"`.
