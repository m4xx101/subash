# subash

Merged multiple tools for more efficient subdomain discovery which includes [assetfinder, crtsh, findomain, jldc, subfinder, amass] it automatically sort all found subdomain and remove similar entries and than run httprobe against it and store both lists.

## Usage:

### (1) Checking dependencies:

```sh
git clone https://github.com/m4xx101/subash.git
cd subash
chmod +x check-dependencies.sh
chmod +x subash.sh

./check-dependencies.sh
```

### (2) Running the script:

```sh
./subash example.com
```
## Thanks to:
[tomnomnom]
[Edu4rdSHL]
[OWASP]
