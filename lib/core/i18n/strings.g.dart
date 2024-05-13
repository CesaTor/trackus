/// Generated file. Do not edit.
///
/// Original: lib/core/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 78 (39 per locale)
///
/// Built on 2024-05-13 at 23:03 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	it(languageCode: 'it', build: _StringsIt.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of i18n).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = i18n.someKey.anotherKey;
Translations get i18n => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final i18n = Translations.of(context); // Get i18n variable.
/// String a = i18n.someKey.anotherKey; // Use i18n variable.
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.i18n.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get i18n => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final i18n = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  );

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsCoreEn core = _StringsCoreEn._(_root);
	late final _StringsSettingsEn settings = _StringsSettingsEn._(_root);
	late final _StringsExplorerEn explorer = _StringsExplorerEn._(_root);
	late final _StringsSearchEn search = _StringsSearchEn._(_root);
}

// Path: core
class _StringsCoreEn {
	_StringsCoreEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get appName => 'Trackus';
	String get today => 'Today';
	String get tomorrow => 'Tomorrow';
	late final _StringsCoreLayoutEn layout = _StringsCoreLayoutEn._(_root);
	late final _StringsCorePriorityEn priority = _StringsCorePriorityEn._(_root);
	late final _StringsCoreProjectEn project = _StringsCoreProjectEn._(_root);
	late final _StringsCoreNavbarEn navbar = _StringsCoreNavbarEn._(_root);
	String get dueDate => 'Due Date';
	String get allDay => 'All Day';
	late final _StringsCoreFormEn form = _StringsCoreFormEn._(_root);
}

// Path: settings
class _StringsSettingsEn {
	_StringsSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	String get backupAndRestore => 'Backup&Restore';
	String get backup => 'Backup';
	String get restore => 'Restore from backup';
	late final _StringsSettingsMessageEn message = _StringsSettingsMessageEn._(_root);
	late final _StringsSettingsErrorEn error = _StringsSettingsErrorEn._(_root);
}

// Path: explorer
class _StringsExplorerEn {
	_StringsExplorerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsExplorerAddEn add = _StringsExplorerAddEn._(_root);
	late final _StringsExplorerMainEn main = _StringsExplorerMainEn._(_root);
}

// Path: search
class _StringsSearchEn {
	_StringsSearchEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Search';
	String get items => 'Tasks';
	String get projects => 'Projects';
	String get hint => 'Title, Description or Project Name...';
}

// Path: core.layout
class _StringsCoreLayoutEn {
	_StringsCoreLayoutEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get list => 'List';
	String get calendar => 'Calendar';
	String get kanban => 'Kanban';
}

// Path: core.priority
class _StringsCorePriorityEn {
	_StringsCorePriorityEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get low => 'Low';
	String get medium => 'Medium';
	String get high => 'High';
	String get none => 'None';
}

// Path: core.project
class _StringsCoreProjectEn {
	_StringsCoreProjectEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get inbox => 'Inbox';
}

// Path: core.navbar
class _StringsCoreNavbarEn {
	_StringsCoreNavbarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get today => 'Today';
	String get inbox => 'Inbox';
	String get search => 'Search';
	String get explore => 'Explore';
}

// Path: core.form
class _StringsCoreFormEn {
	_StringsCoreFormEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Title';
	String get description => 'Description';
}

// Path: settings.message
class _StringsSettingsMessageEn {
	_StringsSettingsMessageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String created({required Object FilePath}) => 'Backup created at ${FilePath}';
	String get restored => 'Backup restored, restart the app to see changes!';
}

// Path: settings.error
class _StringsSettingsErrorEn {
	_StringsSettingsErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get creation => 'Could not create backup, please check your storage permissions';
}

// Path: explorer.add
class _StringsExplorerAddEn {
	_StringsExplorerAddEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Add new project';
	String get favorite => 'Favorite';
	String get layout => 'Layout';
	String get parent => 'Parent project';
	String get noParent => 'No parent project';
	String get parentName => 'Parent name';
	String get cta => 'Add project';
}

// Path: explorer.main
class _StringsExplorerMainEn {
	_StringsExplorerMainEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Explorer';
	String get projects => 'Projects';
}

// Path: <root>
class _StringsIt extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsIt.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.it,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <it>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	@override late final _StringsIt _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsCoreIt core = _StringsCoreIt._(_root);
	@override late final _StringsSettingsIt settings = _StringsSettingsIt._(_root);
	@override late final _StringsExplorerIt explorer = _StringsExplorerIt._(_root);
	@override late final _StringsSearchIt search = _StringsSearchIt._(_root);
}

// Path: core
class _StringsCoreIt extends _StringsCoreEn {
	_StringsCoreIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get appName => 'Trackus';
	@override String get today => 'Oggi';
	@override String get tomorrow => 'Domani';
	@override late final _StringsCoreLayoutIt layout = _StringsCoreLayoutIt._(_root);
	@override late final _StringsCorePriorityIt priority = _StringsCorePriorityIt._(_root);
	@override late final _StringsCoreProjectIt project = _StringsCoreProjectIt._(_root);
	@override late final _StringsCoreNavbarIt navbar = _StringsCoreNavbarIt._(_root);
	@override String get dueDate => 'Scadenza';
	@override String get allDay => 'Tutto il giorno';
	@override late final _StringsCoreFormIt form = _StringsCoreFormIt._(_root);
}

// Path: settings
class _StringsSettingsIt extends _StringsSettingsEn {
	_StringsSettingsIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Impostazioni';
	@override String get backupAndRestore => 'Backup&Ripristino';
	@override String get backup => 'Backup';
	@override String get restore => 'Ripristina da file';
	@override late final _StringsSettingsMessageIt message = _StringsSettingsMessageIt._(_root);
	@override late final _StringsSettingsErrorIt error = _StringsSettingsErrorIt._(_root);
}

// Path: explorer
class _StringsExplorerIt extends _StringsExplorerEn {
	_StringsExplorerIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override late final _StringsExplorerAddIt add = _StringsExplorerAddIt._(_root);
	@override late final _StringsExplorerMainIt main = _StringsExplorerMainIt._(_root);
}

// Path: search
class _StringsSearchIt extends _StringsSearchEn {
	_StringsSearchIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cerca';
	@override String get items => 'Tasks';
	@override String get projects => 'Progetti';
	@override String get hint => 'Titolo, Descrizione o nome del progetto...';
}

// Path: core.layout
class _StringsCoreLayoutIt extends _StringsCoreLayoutEn {
	_StringsCoreLayoutIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get list => 'Lista';
	@override String get calendar => 'Calendario';
	@override String get kanban => 'Kanban';
}

// Path: core.priority
class _StringsCorePriorityIt extends _StringsCorePriorityEn {
	_StringsCorePriorityIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get low => 'Bassa';
	@override String get medium => 'Media';
	@override String get high => 'Alta';
	@override String get none => 'Nessuna';
}

// Path: core.project
class _StringsCoreProjectIt extends _StringsCoreProjectEn {
	_StringsCoreProjectIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get inbox => 'In arrivo';
}

// Path: core.navbar
class _StringsCoreNavbarIt extends _StringsCoreNavbarEn {
	_StringsCoreNavbarIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get today => 'Oggi';
	@override String get inbox => 'In arrivo';
	@override String get search => 'Cerca';
	@override String get explore => 'Esplora';
}

// Path: core.form
class _StringsCoreFormIt extends _StringsCoreFormEn {
	_StringsCoreFormIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Titolo';
	@override String get description => 'Descrizione';
}

// Path: settings.message
class _StringsSettingsMessageIt extends _StringsSettingsMessageEn {
	_StringsSettingsMessageIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String created({required Object FilePath}) => 'Backup creato: ${FilePath}';
	@override String get restored => 'Backup ripristinato, riavvia l\'app per vedere i cambiamenti!';
}

// Path: settings.error
class _StringsSettingsErrorIt extends _StringsSettingsErrorEn {
	_StringsSettingsErrorIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get creation => 'Impossibile creare il backup, prova a controllare i permessi!';
}

// Path: explorer.add
class _StringsExplorerAddIt extends _StringsExplorerAddEn {
	_StringsExplorerAddIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Crea nuovo progetto';
	@override String get favorite => 'Preferito';
	@override String get layout => 'Layout';
	@override String get parent => 'Progetto principale';
	@override String get noParent => 'Nessun progetto principale';
	@override String get parentName => 'Nome progetto principale';
	@override String get cta => 'Aggiungi progetto';
}

// Path: explorer.main
class _StringsExplorerMainIt extends _StringsExplorerMainEn {
	_StringsExplorerMainIt._(_StringsIt root) : this._root = root, super._(root);

	@override final _StringsIt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Esplora';
	@override String get projects => 'Progetti';
}
