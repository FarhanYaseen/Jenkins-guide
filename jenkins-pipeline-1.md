1. Open Jenkins
2. Click New Item
3. Chose Pipeline
4. In the Section Advanced Project Options
5. Under the Pipeline
6. add this hello world script
```
pipeline {
   agent any

   stages {
      stage('Hello') {
         steps {
            echo 'Hello World'
         }
      }
   }
}

```
7. Run the job and check logs