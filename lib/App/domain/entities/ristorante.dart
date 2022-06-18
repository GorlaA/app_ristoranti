class Ristorante {
  String nome;
  String image;
  int rating;
  int personalRating;
  int communityRating;
  String descrizione;
  List<String> foto;
  String indirizzo;
  String categoria;
  int prezzoMedio;

  Ristorante(this.nome, this.image, this.rating, this.descrizione, this.foto, this.indirizzo, this.categoria, this.prezzoMedio, this.personalRating, this.communityRating);

  void setPersonalRating(int newRating){
    personalRating = newRating;
  }

  String getNome(){
    return nome;
  }
  String getImage(){
    return image;
  }
  int getRating(){
    return rating;
  }
  String getDescrizione(){
    return descrizione;
  }
  List <String> getFotos() {
    return foto;
  }

  String getIndirizzo(){
    return indirizzo;
  }

  String getCategoria() {
    return categoria;
  }
  int getPrezzoMedio() {
    return prezzoMedio;
  }
  String getOrario() {
    return "10:00 - 15:00 / 18:00 - 23:00";
  }

  int getRatingPersonale() {
    return personalRating;
  }

  int getCommunityRating() {
    return communityRating;
  }

  String getTitoloCartella() {
    String aus = nome;
    return aus.replaceAll("\n", " ");
  }

}