import '../models/tourist_place_model.dart';

final List<TouristPlaceModel> touristPlaceMock = [
  TouristPlaceModel(
    name: 'Cristo Redentor',
    description: 'Estátua icônica com vista panorâmica da cidade.',
    category: 'Monumento',
    wantToVisit: true,
    rating: 4.8,
    distance: 12.4,
    city: 'Rio de Janeiro',
    isFree: false,
  ),
  TouristPlaceModel(
    name: 'Praia de Copacabana',
    description: 'Praia famosa com calçadão e quiosques.',
    category: 'Praia',
    wantToVisit: false,
    rating: 4.5,
    distance: 8.1,
    city: 'Rio de Janeiro',
    isFree: true,
  ),
  TouristPlaceModel(
    name: 'Parque Ibirapuera',
    description: 'Parque urbano com áreas verdes e museus.',
    category: 'Parque',
    wantToVisit: true,
    rating: 4.6,
    distance: 3.2,
    city: 'São Paulo',
    isFree: true,
  ),
  TouristPlaceModel(
    name: 'Elevador Lacerda',
    description: 'Elevador histórico que liga a cidade alta à baixa.',
    category: 'Atração turística',
    wantToVisit: false,
    rating: 4.2,
    distance: 1.0,
    city: 'Salvador',
    isFree: true,
  ),
];

TouristPlaceModel samplePlace() => touristPlaceMock.first;
