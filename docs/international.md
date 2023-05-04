
```bash
dart run intl_translation:extract_to_arb --output-dir=lib/l10n lib/main.dart
```

```bash
dart run intl_translation:generate_from_arb \
    --output-dir=lib/l10n --no-use-deferred-loading \
    lib/main.dart lib/l10n/intl_*.arb
```

提取代码中的字符串到一个arb文件

```bash
~/fvm/versions/3.3.10/bin/flutter pub get
~/fvm/versions/3.3.10/bin/flutter pub run intl_generator:extract_to_arb --output-dir=l10n lib/l10n/localization_intl.dart

~/fvm/versions/3.3.10/bin/flutter pub pub run intl_generator:generate_from_arb \
--output-dir=lib/generated/intl --no-use-deferred-loading /Users/xiaoqiangjiang/source/reddwarf/frontend/telepathy/lib/l10n/localization_intl.dart /Users/xiaoqiangjiang/source/reddwarf/frontend/telepathy/lib/l10n/"intl_en".arb

~/fvm/versions/3.3.10/bin/flutter pub pub run intl_generator:generate_from_arb \
--output-dir=lib/generated/intl --no-use-deferred-loading /Users/xiaoqiangjiang/source/reddwarf/frontend/telepathy/lib/l10n/localization_intl.dart /Users/xiaoqiangjiang/source/reddwarf/frontend/telepathy/lib/l10n/"intl_zh".arb


flutter pub pub run intl_generator:extract_to_arb --output-dir=l10n-arb \ lib/l10n/localization_intl.dart

```

