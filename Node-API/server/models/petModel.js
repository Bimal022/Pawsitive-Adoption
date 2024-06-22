import mongoose from 'mongoose';

const petSchema = mongoose.Schema(
  {
    image: { type: String, required: true },
    name: { type: String, required: true },
    id: {type: Number, required:true},
    location: { type: String, required: true },
    description: { type: String, required: true },
    rate: { type: Number, required: true },
    price: { type: String, required: true },
    ownerName: { type: String, required: true },
    ownerPhoto: { type: String, required: true },
    sex: { type: String, required: true },
    age: { type: String, required: true },
    color: { type: String, required: true },
    album: [{ type: String, required: true }],
    isFavorited: { type: Boolean, default: false }
  },
  {
    timestamps: true
  }
);

const Pet = mongoose.model('Pet', petSchema);

export default Pet;
