#!/bin/sh

# Reference code: https://github.com/GoogleCloudPlatform/community/blob/master/archived/speech2srt/index.md

python speech2srt.py --storage_uri gs://sample-wav-file/wastewater.wav --language_code cmn-CN --sample_rate_hertz 44100 --out_file out.srt --audio_channel_count 2

python translate_txt.py --project_id vector-search-demo --location global --source_lang zh --target_lang th --input_uri gs://sample-wav-file/out.txt --output_uri gs://sample-wav-file/translated

python txt2srt.py --srt out.srt.srt --index translated_index.csv
