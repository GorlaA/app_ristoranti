class User {
  String nome;
  String cognome;
  String foto;
  String mail;
  String citta;
  User(this.nome, this.cognome, this.mail, this.foto, this.citta);

  get getNome => nome;
  get getCognome => cognome;
  get getMail => mail;
  get getFoto => foto;
}
