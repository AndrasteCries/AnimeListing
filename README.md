# AnimeListing

## Descriprion 
 
AnimeListing is a online resource dedicated to anime, providing an extensive database of various Japanese animated series. On the website, users can find information about different anime: descriptions, ratings, reviews, statistics, and much more. Additionally, AnimeListing offers a platform for communication among anime fans, allowing discussions on series, posting reviews, and exchanging recommendations. Each user has their personalized profile where they can add lists of favorite anime, write reviews, etc.

# Table of Contents
1. [API documentation](#API)
2. [Diagrams](#diagrams)
3. [Scripts](#scripts)
4. [Installation](#installation)

## Diagrams

### Database ER-diagram
![DB ER-diagram](https://github.com/AndrasteCries/AnimeListing/blob/main/docs/ER_diagram_v1.png)

## Scripts

1. Default scripts:
```sh
    #Database migrate
    rake db:migrate

    #Seed data
    rake db:seed
```
## Installation
1. Clone the repository from GitHub:
```sh
    git clone https://github.com/AndrasteCries/AnimeListing.git
```
2. Navigate to the project directory:
```sh
    cd EducationPlatform
```
3. Install dependencies using Bundler:
```sh
    bundle install
```
4. Configure the database:
```sh
    rake db:migrate
```
5. Start the application:
```sh
    rails server
```
6. Access the application in your web browser at:
```sh
    http://localhost:3000
```
