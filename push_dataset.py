from huggingface_hub import HfApi

hub_api = HfApi()
hub_api.create_tag("coport-uni/piper-test", tag="v2.1", repo_type="dataset")