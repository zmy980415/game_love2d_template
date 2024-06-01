## 原框架自带的lib

> 原先项目自带的lib包括
- 相机 camera、
- 类 class、

- husl:这段Lua代码定义了一个名为`husl`的模块，用于实现HUSL（Hue, Saturation, Lightness）颜色空间到RGB颜色空间的转换。HUSL是一种基于光源的Lab颜色空间的变体，它更易于处理，并且在某些情况下可以提供更自然的颜色对比。

        以下是代码的主要功能：

        1. 定义了一些常量，如光源参考值（refX, refY, refZ）、kappa、epsilon等。
        2. 定义了一个用于转换HUSL到RGB的`husl_to_rgb`函数。
        3. 定义了一个用于转换HUSL到16进制颜色的`husl_to_hex`函数。
        4. 定义了一个用于转换RGB到HUSL的`rgb_to_husl`函数。
        5. 定义了一个用于转换16进制颜色到HUSL的`hex_to_husl`函数。
        6. 定义了一个用于转换HUSL到Lab颜色的`husl_to_lch`函数。
        7. 定义了一个用于转换Lab颜色到HUSL的`lch_to_husl`函数。
        8. 定义了一个用于计算最大饱和度的函数`max_chroma`。
        9. 定义了一个用于计算最大饱和度（ Pastel版本）的函数`max_chroma_pastel`。
        10. 定义了一个用于转换RGB到16进制颜色的`rgb_to_hex`函数。
        11. 定义了一个用于转换16进制颜色到RGB颜色的`hex_to_rgb`函数。
        12. 定义了一个用于转换XYZ到Lab颜色的`xyz_to_luv`函数。
        13. 定义了一个用于转换Lab颜色到XYZ的`luv_to_xyz`函数。
        14. 定义了一个用于转换Luv到LCH的`luv_to_lch`函数。
        15. 定义了一个用于转换LCH到Luv的`lch_to_luv`函数。
        16. 定义了一个用于计算HUSL最大饱和度的函数`husl_to_lch`。
        17. 定义了一个用于将HUSL颜色转换为LCH颜色的`lch_to_husl`函数。
        18. 定义了一个用于将HUSL颜色转换为huslp颜色的`husl_to_huslp`函数。
        19. 定义了一个用于将huslp颜色转换为HUSL颜色的`huslp_to_husl`函数。

        总之，这段代码提供了一组函数，用于将颜色从HUSL颜色空间转换为RGB颜色空间，以及将RGB颜色空间转换为HUSL颜色空间。这些函数可以用于创建颜色转换库、颜色处理工具或其他与颜色相关的应用。
- inspect

    这个文件定义了一个名为`inspect`的函数，该函数可以用来生成具有人类可读格式的表单数据。这个库提供了许多功能，包括处理表单、序列、元表、函数、用户数据、线程等类型的数据。它还可以处理具有嵌套结构的数据，并提供了一个用于处理具有特定类型的数据的选项。

    这个库的主要功能包括：

    1. 定义了一个`inspect`函数，该函数接受一个表单作为参数，并返回一个字符串，该字符串表示具有人类可读格式的表单数据。
    2. 定义了`KEY`和`METATABLE`常量，它们分别表示用于表示表单中键和元表的符号。
    3. 定义了一个`smartQuote`函数，该函数用于将字符串中的引号smart化，以避免在某些情况下出现不想要的转义序列。
    4. 定义了一个`escape`函数，该函数用于将字符串中的特殊字符（如单引号、双引号和制表符）进行转义，以使其在输出中具有适当的表示。
    5. 定义了一个`isIdentifier`函数，该函数用于检查一个字符串是否符合标识符的规则。
    6. 定义了一个`isSequenceKey`函数，该函数用于检查一个键是否是序列类型的键。
    7. 定义了一个`defaultTypeOrders`表，其中包含对不同类型的默认排序顺序。
    8. 定义了一个`sortKeys`函数，该函数用于根据`defaultTypeOrders`表对键进行排序。
    9. 定义了一个`getSequenceLength`函数，该函数用于获取一个表的长度。
    10. 定义了一个`getNonSequentialKeys`函数，该函数用于获取一个表的非序列类型键。
    11. 定义了一个`getToStringResultSafely`函数，该函数用于获取一个表的`__tostring`结果，并处理可能的错误。
    12. 定义了一个`countTableAppearances`函数，该函数用于计算一个表在另一个表中出现的次数。
    13. 定义了一个`copySequence`函数，该函数用于复制一个序列。
    14. 定义了一个`makePath`函数，该函数用于创建一个表示表单路径的字符串。
    15. 定义了一个`processRecursive`函数，该函数用于递归地处理一个表单及其子项。
    16. 定义了一个`Inspector`类，该类包含一些方法，用于输出和处理表单数据。
    17. 定义了一个`Inspector_mt`元表，该元表将`Inspector`类的元表设置为`inspect`函数的元表。
    18. 定义了一个`tostring`函数，该函数用于将一个值转换为字符串。
    19. 定义了一个`down`函数，该函数用于递归地调用一个函数。
    20. 定义了一个`tabify`函数，该函数用于在输出中添加制表符。
    21. 定义了一个`alreadyVisited`函数，该函数用于检查一个对象是否已被访问过。
    22. 定义了一个`getId`函数，该函数用于获取一个对象的ID。
    23. 定义了一个`puts`函数，该函数用于输出一个字符串。
    24. 定义了一个`putKey`函数，该函数用于输出一个键。
    25. 定义了一个`putTable`函数，该函数用于输出一个表。
    26. 定义了一个`putValue`函数，该函数用于输出一个值。
    27. 定义了一个`inspect`函数，该函数用于生成具有人类可读格式的表单数据。
    28. 将`inspect`函数的元表设置为`__call`函数的元表，以便它可以作为函数调用。
    29. 返回`inspect`函数。

## 新增加的lib








