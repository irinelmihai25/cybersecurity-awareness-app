// lib/models/email_model.dart

class EmailSimulat {
  final String expeditor;
  final String adresaEmail;
  final String subiect;
  final String mesaj;
  final bool estePhishing;
  final String explicatie;

  EmailSimulat({
    required this.expeditor,
    required this.adresaEmail,
    required this.subiect,
    required this.mesaj,
    required this.estePhishing,
    required this.explicatie,
  });
}

// Baza ta de date de mail-uri pentru misiune
List<EmailSimulat> listaEmailuriPhishing = [
  // 1. Exemplul tău din imagine (Phishing)
  EmailSimulat(
    expeditor: "Serviciul de Suport Tehnic",
    adresaEmail: "suport.tehnic@firma.co", // SUSPECT (.co nu e firma.com)
    subiect: "ACȚIUNE IMEDIATĂ NECESARĂ: Contul Tău Expiră în 2 Ore!",
    mesaj: "Stimate Utilizator,\n\nam detectat o problemă cu plata abonamentului. Dacă nu faci click pe link-ul de mai jos în 2 ore, contul tău va fi dezactivat permanent.\n\n",
    estePhishing: true,
    explicatie: "E-mailul folosește un ton urgent și o adresă suspectă (.co).",
  ),
  // 2. Un exemplu legitim
  EmailSimulat(
    expeditor: "Google Accounts",
    adresaEmail: "no-reply@accounts.google.com", // LEGITIM
    subiect: "Alertă de securitate nouă",
    mesaj: "Un dispozitiv nou s-a conectat la contul tău. Dacă ai fost tu, ignoră acest mesaj.",
    estePhishing: false,
    explicatie: "Adresa expeditorului este oficială și mesajul e standard.",
  ),
];