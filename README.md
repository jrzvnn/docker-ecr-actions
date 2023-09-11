# Docker Image Push to Amazon ECR with GitHub Actions

Automate Docker image pushes from Docker Hub to Amazon Elastic Container Registry (ECR) using GitHub Actions.

## Setup

1. **Clone the Repository**:
   Clone this GitHub repository to your local machine using the following command:
     ```shell
     git clone https://github.com/jrzvnn/docker-ecr-actions
     ```
    Navigate to the cloned repository directory:
     ```shell
     cd docker-ecr-actions
     ```

2. **GitHub Secrets**: 
   Set up the following secrets in your GitHub repository:
     - `AWS_ACCESS_KEY_ID`: Your AWS access key ID.
     - `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.

3. **Define Docker Images**:
   To specify the Docker images you want to push to Amazon ECR, open the `scripts.sh` file and modify the `IMAGES` array. Add or remove image names as needed. For example:
    ```bash
        IMAGES=(
        # Define the list of images to pull and push
        )
    ```

4. **Commit and Push**:
   Commit both the workflow YAML file and the script file to your repository.

## Usage
GitHub Actions will automatically run the workflow on each push to the specified branch, pulling and pushing the Docker images to your ECR repository.

## License
This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
