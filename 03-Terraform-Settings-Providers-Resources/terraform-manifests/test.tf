from pytube import YouTube

def download_video(url, output_directory):
    try:
        yt = YouTube(url)
        stream = yt.streams.get_highest_resolution()
        stream.download(output_path=output_directory)
        print("Download completed successfully!")
    except Exception as e:
        print(f"An error occurred: {str(e)}")

# Example usage
video_url = "https://www.youtube.com/watch?v=n06H7OcPd-g"
download_directory = "/path/to/download/directory"
download_video(video_url, download_directory)
