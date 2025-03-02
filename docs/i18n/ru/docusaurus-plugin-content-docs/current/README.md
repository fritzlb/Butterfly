---
title: Введение
id: intro
slug: /intro
sidebar_position: 1
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';
import { Gear, Plus, FloppyDisk, MagnifyingGlass, ScribbleLoop, Pen, Path, ArrowCounterClockwise, ArrowClockwise, Hand, Wrench, Lock} from "@phosphor-icons/react";

![Баннер](/img/banner.png)

---

> Добро пожаловать в приложение заметок от Баттерфли.

Бабочка - это заметка, делающая приложение, которое стремится к единому опыту на всех платформах. Он предоставляет простой интерфейс с мощной настройкой.

## Приступая к работе

> Вы можете использовать боковую панель для быстрого перехода по вики.


Чтобы начать работу над приложением, у вас есть два варианта:
1. [Downloads](/downloads) версия приложения, подходящая для вашей платформы (Butterfly может работать на большинстве мобильных, настольных и веб-платформах).
2. Используйте [веб-версию](https://butterfly.linwood.dev) , если вы не можете найти свою платформу или не хотите ее устанавливать. See [here](storage#web) about file storage on the web version.

> Как только вы откроете приложение, продолжайте чтение.



## Основной вид

![Основной вид](main.png)

Основной взгляд состоит из нескольких элементов
<Tabs
    defaultValue = "desktop"
    groupId="platfrom"
        values={[
        {label:"Desktop", value:'desktop'},
 {label:"Mobile", value:'mobile'},
 ]}>
    <TabItem value="desktop">
        ![Экран приветствия](/img/welcome_screen_desktop.png)
        В верхней части экрана отображается баннер для обновлений, ссылка на эту документацию и значок конфигурации <Gear/>. Наконец, справа от символа конфигурации <Gear/> у вас есть выпадающее меню для управления когда этот баннер появится (всегда/никогда/не обновляется).
        Раздел "Файлы" в основной области слева. Там, вы можете выполнить типичные операции:
            - Выберите тип дисплея (сетка или список)
            - выберите [исходное хранилище](storage) файлов
            - Сортировку отображения файлов
            - Добавить папку, файл, шаблон, или импортируйте файлы, нажав на знак <Plus/> плюс
            - введите прямой путь к нужному месту (поле Местоположения),
            - Поиск файлов
        Наконец, справа у вас есть быстрый стартовый экран с шаблонами, доступными в текущем месте. Для новой установки включает легкий и темный шаблон
    </TabItem>
    <TabItem value="mobile">
        При открытии Butterfly на мобильном устройстве вам будет представлен экран как это
        ! Первая часть экрана приветствия](/img/welcome_screen_mobile_1. ng)   
        В верхней части экрана отображается баннер для обновлений, и ниже вы можете найти ссылку на documnentation и рядом с ней значок конфигурации <Gear/>. Наконец, справа от символа конфигурации <Gear/> у вас есть выпадающее меню для управления когда этот баннер появится (всегда/никогда/не обновляется).
        Ниже вы можете найти раздел быстрого старта, содержащий шаблоны, доступные для вас. С помощью десерта шаблоны являются светлыми и темными шаблонами. 
        Прокрутка вниз, вы увидите файловый интерфейс:
        \
        ! Вторая часть экрана приветствия](/img/welcome_screen_mobile_2. ng)  
        Раздел "Файлы" в основной области слева. Там, вы можете выполнить типичные операции:
        - Выберите тип дисплея (сетка или список)
        - выберите [исходное хранилище](storage) файлов
        - Сортировку отображения файлов
        - Добавить папку, файл, шаблон, или импортируйте файлы, нажав на знак <Plus/> плюс
        - введите прямой путь к нужному месту (поле Местоположения),
        - Поиск файлов
    </TabItem>
</Tabs>

Once opening a document by selecting a template or an existing file, you will get to the **Document View**

## Документ Просмотр

Вы можете вернуться из документа в список документов с обратным действием вашего устройства. Как и в случае с основным представлением, документ отображает изменения на основе вашего устройства.

<Tabs
    defaultValue = "desktop"
    groupId="platfrom"
        values={[
        {label:"Desktop", value:'desktop'},
 {label:"Mobile", value:'mobile'},
 ]}>
    <TabItem value="desktop">
        В режиме рабочего стола вы увидите верхнюю часть строки файла\
        ![file_bar](/img/document_view_file_bar. ng)\
        Эта зацепка слева направо, the 
        [<img alt="logo" src="/img/logo.png" width="16"/>](/img/logo. ng)
        кнопка "бабочка" для открытия меню. Рядом с ним есть поле имя, которое отображает имя заметки. Вы можете переименовать записку, введя новое имя в это поле и сохранив ее с помощью кнопки 'Сохранить' <FloppyDisk/>. Finally you can <MagnifyingGlass/> search for elements within the note.
        \
        В правом верхнем углу экрана у вас есть панель инструментов\
        ![toolbar](/img/document_view_toolbar. ng)\
        по умолчанию эта панель содержит инструмент лассо <ScribbleLoop/> ; <Pen/> pen tool; инструмент стирания контуров <Path/> ; отмена <ArrowCounterClockwise/> и <ArrowClockwise/> повторных бутонов и инструмент руки <Hand/>. Затем у вас есть кнопка <Plus/> для добавления элементов на панель инструментов, кнопка <Wrench/> для настройки документа, и, наконец, инструмент <Lock/> для просмотра масштаба и/или положения экрана. 
        ### Важные заметки
        1. Если некоторые элементы на панели инструментов не видны, нажмите и перетащите их влево и вправо, чтобы открыть дополнительные инструменты. 
        2. После выбора инструмента появится небольшое меню. Долгое нажатие на инструменте снова позволит вам перетащить его на новую позицию
        3. Вы можете добавить инструменты на панель инструментов, нажав на знак <Plus/> плюс. 
    </TabItem>
    <TabItem value="mobile">
        В мобильном виде вы будете иметь верхнюю панель файлов\
        ![file_bar](/img/document_view_file_bar. ng)\
        Эта зацепка слева направо, the 
        [<img alt="logo" src="/img/logo.png" width="16"/>](/img/logo. ng)
        кнопка "бабочка" для открытия меню. Рядом с ним есть поле имя, которое отображает имя заметки. Вы можете переименовать записку, введя новое имя в это поле и сохранив ее с помощью кнопки 'Сохранить' <FloppyDisk/>. Finally you can <MagnifyingGlass/> search for elements within the note.
        \
        В нижней части экрана у вас есть панель инструментов\
        ![toolbar](/img/document_view_toolbar. ng)\
        по умолчанию эта панель содержит инструмент лассо <ScribbleLoop/> ; <Pen/> pen tool; инструмент стирания контуров <Path/> ; отмена <ArrowCounterClockwise/> и <ArrowClockwise/> повторных бутонов и инструмент руки <Hand/>. Затем у вас есть кнопка <Plus/> для добавления элементов на панель инструментов, кнопка <Wrench/> для настройки документа, и, наконец, инструмент <Lock/> для просмотра масштаба и/или положения экрана. 
        ### Важные заметки
        1. Если некоторые элементы на панели инструментов не видны, или проведите пальцем влево и вправо, чтобы выявить дополнительные элементы. 
        2. После выбора инструмента появится небольшое меню для его настройки. Долгое нажатие на инструменте снова позволит вам перетащить его на новую позицию
        3. Вы можете добавить инструменты на панель инструментов, нажав на знак <Plus/> плюс. 
    </TabItem>
</Tabs>
	

