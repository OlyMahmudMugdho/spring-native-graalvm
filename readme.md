# Make native images of spring boot
select graalvm as jdk <br>
then run

```
mvn clean package native:compile -Pnative -DskipTests
```

or

```
./mvnw clean package native:compile -Pnative -DskipTests
```