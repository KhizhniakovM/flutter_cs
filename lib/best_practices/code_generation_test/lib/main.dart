void main() {
  final whatThe = WhatThe();

  
}

// Аннотации просто несут дополнительную информацию
class Example {
  final String name;
  final int age;

  // Должен быть константный конструктор
  const Example(this.name, this.age);
}
// Пример использования
@Example('Max', 26)
class WhatThe {}

// build_runner - пакет, который помогает нам в кодогенерации 
// Создаем отдельную папку для всего этого (добавляем .dart)
// В ней создаем два пакета
// Пакет с аннотациями, пакет с генератором 
// flutter create --template=package todo_reporter
// flutter create --template=package todo_reporter_generator
// И там же создаем папку с примером их работы 
// 
// Файл todo_reporter.dart в папке lib пакета todo_reporter 
// должен содержать все export всех публичных api 
// этого пакета
// 
// В этой же папке создаем папку src со всем кодом нашего проекта
// Там создаем наши аннотации 
// И не забывем про тесты =))
// 
// В пакете todo_reporter_generator создаем build.yaml, builder.dart и src 
// Этот пакет будет добавляться, как dev_dependency
// 
// Добавить source_gen, ваш первый пакет с path 
// ```
//   todo_reporter:
//    path: ../todo_reporter/
// ```
// + build пакет 
// 
// В dev dependencies 
// + build_runner 
// + build_test
// 
// Конфигурируем build.yaml 
// https://github.com/dart-lang/build/blob/master/build_config/README.md
// 
// И создаем файлы с методами генерации в lib и src 

// https://habr.com/ru/post/446264/