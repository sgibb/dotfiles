# Build `stow` locally

```bash
https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz
tar -xvzf stow-latest.tar.gz
cd stow-*/
./configure --with-pmdir="${HOME}/opt/share/perl5" && make && make install prefix="${HOME}/opt"
export PATH="${HOME}/opt/bin/:${PATH}"
```
