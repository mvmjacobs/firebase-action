# Github Action for Firebase
A GitHub Action to deploy to Firebase Hosting using firebase-tools CLI.

## How to use
Creating your workflow to build and deploy to Firebase Hosting.

```yaml
name: Build and Deploy

on:
  push:
    branches: master

jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout the repository
        uses: actions/checkout@master

      - name: Install Dependencies
        run: npm install

      - name: Build
        run: npm run build
      
      - name: Archive Production Artifact
        uses: actions/upload-artifact@master
        with:
          name: dist
          path: dist

  deploy:
    name: Deploy
    needs: build
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout the repository
        uses: actions/checkout@master

      - name: Download Artifact
        uses: actions/download-artifact@master
        with:
          name: dist

      - name: Deploy to Hosting
        uses: mvmjacobs/firebase-action@master
        with:
          args: deploy --only hosting
        env:
          GITHUB_FIREBASE_TOKEN: ${{ secrets.GITHUB_FIREBASE_TOKEN }}
```

## Variables and secrets
* `args`: This is the arguments that `firebase` command will run.

* `GITHUB_FIREBASE_TOKEN`: The token to use for authentication.
  - You can get a token with `firebase login:ci`
  - For information about using secrets in GitHub Actions please see the [Github Action Docs for Encrypted Secrets.](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets)

## How to contribute
[Open an issue](https://github.com/mvmjacobs/firebase-action/issues).

## License
This repository is licensed under the [MIT License](https://github.com/mvmjacobs/firebase-action/blob/master/LICENSE.md).
