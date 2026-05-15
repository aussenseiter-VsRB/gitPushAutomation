# gh-autoPush-script

Script otomatis untuk membuat repo GitHub baru dan push repo lokal yang sudah ada menggunakan **gh CLI** dan **git**.

## Fitur

- Inisialisasi git secara otomatis jika belum ada
- Membuat *initial commit* jika belum ada commit
- Rename branch `master` ke `main` secara otomatis
- Membuat repositori GitHub baru (public/private)
- Push langsung ke remote

## Penggunaan

```bash
./gh-create-and-push.sh [nama-repo] [public|private]
```

### Contoh pengunaan

```bash
# Public repo (default)
./gh-create-and-push.sh my-project

# Private repo
./gh-create-and-push.sh my-project private
```

## Syarat penjalan script

- [Git](https://git-scm.com/)
- [GitHub CLI (gh)](https://cli.github.com/) — sudah login dengan `gh auth login`
