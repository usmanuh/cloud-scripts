# 🚀 Hugo + AWS S3 + CloudFront Deploy Script

![MIT License](https://img.shields.io/badge/license-MIT-green)

This Bash script automates the deployment of a [Hugo](https://gohugo.io/) static site to an AWS S3 bucket with CloudFront as the CDN. Ideal for static site hosting with cache invalidation on every update.

---

## 📁 How It Works

1. 🏗️ **Builds** the site using Hugo  
2. ☁️ **Uploads** the `public/` folder contents to your S3 bucket  
3. 🚦 **Creates a CloudFront invalidation** to refresh cached pages  

---

## 🧩 Prerequisites

- 🛠️ [Hugo](https://gohugo.io/getting-started/installing/) installed locally  
- 🔧 [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) installed and configured  
- 🌐 An existing:
  - ✅ S3 bucket with static website hosting enabled  
  - ✅ CloudFront distribution linked to the S3 bucket

---

## ✏️ Configuration

Set your environment variables in the terminal before running the script:

```bash
export HUGO_BUCKET_NAME="your-s3-bucket-name"
export HUGO_DIST_ID="your-cloudfront-distribution-id"
```

---

## 🏃 Usage

Make the script executable (first time only):

```bash
chmod +x deploy-hugo-to-s3.sh
```

Then run it:

```bash
./deploy-hugo-to-s3.sh
```

---

## 🧼 Notes

- The script uses `aws s3 sync` to upload only changed files and delete removed ones.  
- The CloudFront invalidation clears cached files at all paths (`/*`) — you get 1,000 free invalidations per month.  
- Do **not** commit any AWS credentials or secrets to your repository.  

---

## 🔒 Security

Make sure your AWS credentials are handled securely:

- Use `aws configure` or environment variables  
- Never hardcode credentials into the script  
- Don’t commit secrets to version control  

---

## 👤 Author

**Usman Ul-Haq**  
Cloud Engineer  
[GitHub](https://github.com/usmanuh) • [LinkedIn](https://www.linkedin.com/in/usman-ul-haq-587812294/)

---

## ⚖️ License

This project is licensed under the MIT License.  
Free to use, modify and distribute.
