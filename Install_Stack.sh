rm go*
rm -Rf /usr/local/go
apt install git -y
wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
tar -C /usr/local -xvf go1.22.0.linux-amd64.tar.gz
if ! grep -q "/go/bin" /etc/environment; then
  if grep -q "PATH=\"" /etc/environment; then
    sed -i 's/PATH=\"/PATH=\"\/usr\/local\/go\/bin:\/root\/go\/bin:/g' /etc/environment
    echo '/etc/environment modified. Double Check that sucker in case you just broke it!'
    export PATH="$PATH:/usr/local/go/bin:/root/go/bin"
  fi
if grep -q "PATH=/" /etc/environment; then
        sed -i 's/PATH=/PATH=\/usr\/local\/go\/bin:\/root\/go\/bin:/g' /etc/environment
        export PATH="$PATH:/usr/local/go/bin:/root/go/bin"
        export PATH
fi
fi
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
nuclei -ut
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/bp0lr/gauplus@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
mkdir -p ~/.config/notify/
touch ~/.config/notify/provider-config.yaml
go install -v github.com/tomnomnom/gf@latest
mkdir ~/.gf
git clone https://github.com/1ndianl33t/Gf-Patterns.git
cp Gf-Patterns/* ~/.gf/
go install github.com/tomnomnom/qsreplace@latest
