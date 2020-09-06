# subash

Merged multiple tools for more efficient subdomain discovery which includes [assetfinder, cartsh, findomain, jldc, subfinder, amass] it automatically short all found subdomain and remove similar entries and than run httprobe against it and store both lists to the give path.

## Usage:

### (1) Checking dependencies:

```sh
git clone https://github.com/m4xx101/subash.git
cd subash
chmod +x check-dependencies.sh
./check-dependencies.sh
```

### (2) Running the script:

```sh
./subash example.com ~/Document/test
```
