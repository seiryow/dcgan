# DCGAN in Tensorflow

## Preparation

* Put your dataset (images) in `data/dataset_dir`.  
* Run the following command to replicate your dataset to 2.5 million images.
* The replicated dataset will be saved at `data/dataset_dir_gen`.
Because it is very heavy, please do not open it by file manager to see the contents.

```
./make_general dataset_dir
```

## Run DCGAN

```
python main.py --dataset dataset_dir_gen --batch_size=16 \
	--input_height=512 --output_height=512 \
	--sample_dir=synthesized_dataset --input_fname_pattern="*.png" \
	--train
```

* Synthesized images will be saved at `synthesized_dataset`
