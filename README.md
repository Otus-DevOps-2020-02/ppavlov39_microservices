# ppavlov39_microservices

<h1>Docker-2</h1>
При использовании различных namespaces достигается изоляция контейнера в различных областях. Например,<br>
<pre>docker run --rm -ti tehbilly/htop</pre>покажет тольк один процес - htop, а
<pre>docker run --rm --pid host -ti tehbilly/htop</pre>покажет все процессы хостовой системы.
<h3>Задание со * </h3>
Контейер отличается от образа тем, что будучи созданным на основании какого-то образа, может быть запущен и изменен, а также имеет такие атрибуты как параметры сети, изоляции, органичения ресурсов и т.п.,  в то время как образ это неизменяемый объект, необладающий такими атрибутами.

<h1>Docker-3</h1>
<b>Задание со *</b><br>
При запуске контейнера можно объявить (или переобъявить) значение переменных окружения испольщуя ключ "-e", например: "-e VAR_NAME='var_value'"
<p>
<b>В этой работе сделано:</b>
<ul>
  <li>Изучен синтаксис Dockerfile;</li>
  <li>Изучены методы уменьшения размера итоговых образов за счет оптимизации использования кеша;</li>
  <li>Составлены Dockerfile для четырех компонентов: три для элементов приложения и один для базы данных;</li>
  <li>Создана новая сеть "reddit";</li>
  <li>Для сохранения состояния приложения, в контейнер с БД подключен том под данные;</li>
  <li>Установлен и применен линтер hadolint;</li>
  <li>Изучена возможность задания значения переменных окружения при запуске контейнера, используя ключ "-e";</li>
</ul>

<h1>Docker-4</h1>
<b>Задание со *</b><br>
<ul>
<li>Создан файл docker-compose.override.yml, переопределяющий пераметры заданные в docker-compose.yml. В нем переопределена команда запуска приложения:
<pre>puma --debug -w 2</pre></li>
<li>Изменять код приложения без необходимости в сборке образа можно используя опцию volumes и подключая дирректорию с кодом приложения напрямую с хоста в контейнер.<br>
Например:
<pre>
volumes:
  ./comment:/app
</pre></li>
</ul>
<p>
<b>В этой работе сделано:</b>
<ul>
  <li>Изучены типы сетей, поддерживаемых docker, опробованы на практике сети типов: none, bridge и host;</li>
  <li>Опробован запуск компонентов приложения в двух изолированных сетях, а также динамическое подключение работающего контейнера к дополнительной сети;</li>
  <li>Написан docker-compose.yml, отвечающий за запуск и конфигурацию взаимодействия контейнеров;</li>
  <li>В файл docker-compose.yml введены переменные, значения которых беруться из файла .env;</li>
  <li>Доработана конфигурация сети - контейнеры запускаются в двух сетях: front_net и back_net, также добавлен алиас comment_db сервису post_db (mongo), для доступности сервису комментариев;</li>
  <li>Изучен вопрос формирования имени проекта: задать имя проекта можно с помощью ключа -р , переменной окружения COMPOSE_PROJECT_NAME или переменной с тем же именем в файле .env;</li>
</ul>

<h1>Gitlab-CI</h1>
<b>В этой работе сделано:</b>
<ul>
  <li>Выполнено развертывание тестового инстанса Gitlab, на базе docker-образа, произведа первичная конфигурация;</li>
  <li>Сконфигурирован Gitlab-runner;</li>
  <li>Изучены основные возможности функцианала непрерывной интеграции;</li>
  <li>Выполнено знакомство с динамическими окружениями.</li>
</ul>

<h1>Monitoring-1</h1>
<b>В этой работе сделано:</b>
<ul>
  <li>Выполнено знакомство с Prometheus: опробован его запуск в docker-контейнере, изучен веб-интерфейс;</li>
  <li>Написан конфиг Prometheus для нашей инфраструктуры;</li>
  <li>Собран свой docker-файл Prometheus для добавления нашего конфига в образ;</li>
  <li>Доработан файл docker-compose.yml, запускающий все сервисы, в него добавлены необходимые экпортеры и сам Prometheus.</li>
</ul>
<b>Задание со *</b><br>
<ul>
  <li>Добавлен мониторинг MongoDB с помощью экспортера "Percona MongoDB Exporter";</li>
  <li>Добавлен мониторинг tcp-сокетов приложений с помощью "Blackbox exporter";</li>
  <li>Написан Makefile для запуска сборки и пуша контейнеров.</li>
</ul>

<h1>Monitoring-2</h1>
<b>В этой работе сделано:</b>
<ul>
  <li>Из файла docker-compose.yml в файл docker-compose-monitoring.yml вынесено все описение инфраструктуры мониторинга;</li>
  <li>Для отслеживания метрик контейнеров добавлен сервис cAdvisor;</li>
  <li>Для визуализации метрик настроена Grafana, берущая данные о метриках из Prometheus;</li>
  <li>Добавлено несколько дашбордов: UI_Service_Monitoring и Business_Logic_Monitoring;</li>
  <li>Добавлен и настроен Alertmanager, при недоступности любого из Endpoint-ов будет отправлено уведомление в Slack;</li>
</ul>

<h1>Logging-1</h1>
<b>В этой работе сделано:</b>
<ul>
  <li>Обновлен код приложений для поддержки функционала логирования;</li>
  <li>Написано новый docker-compose файл для развертывания стека EFK;</li>
  <li>Скорректирован docker-compose файл для развертывания приложений, включающий отправку логов во Fluentd;</li>
  <li>В конфиге Fluentd настроены фильтры для разбора структурированных и не структурированных логов;</li>
  <li>Развернут Zipkin для трейсинга наших приложений.</li>
</ul>
<b>Задание со *</b><br>
<ul>
  <li>Настроен парсинг второго формата логов от сервиса UI:
<pre><filter service.ui>
  @type parser
  format grok
  grok_pattern service=%{WORD:service} \| event=%{WORD:event} \| path=%{URIPATHPARAM:path} \| request_id=%{GREEDYDATA:request_id} \| remote_addr=%{IP:remote_addr} \| method= %{WORD:method} \| response_status=%{NUMBER:response_status}
  key_name message
  reserve_data false
</filter>
</pre></li>
<li>Решене проблемы с поломанным приложением.<br>При просмотре zipkin видим, что у сервиса UI возникает ошибка при обращении к сервису Post. Для выяснения причин ошибки идем в kibana и смотри логи. По логам понимаем, что сервис UI не может подключиться к сервису Post, так как он пытается подключиться по адресу 127.0.0.1, к тому же с неверным портом. Задаем нужные параметры (прямо в коде или через переменные) и пробуем подключиться - теперь сервис Post доступен, но падает с ошибкой подключения к БД. Причиной ошибки снова оказывается не верно указанные адрес и порт подключения. По мимо этого адрес сервиса Comment в конфигах UI тоже ошибочен. </li>
</ul>
