import CiOSNDI
import Foundation
import CoreMedia

public class swift_ndi {

    private var ndiSend: NDIlib_send_instance_t?

//    class func initialize() {
//        NDIlib_initialize()
//    }

    public init?() {
        let result = NDIlib_initialize()
        NDIlib_version()
        if !result {
            return nil
        }
    }

    public func start(_ name: String?) {
        self.stop()

        let ndiName = (name as NSString?)?.cString(using: String.Encoding.utf8.rawValue)
        var options = NDIlib_send_create_t(p_ndi_name: ndiName, p_groups: nil, clock_video: false, clock_audio: false)
        self.ndiSend = NDIlib_send_create(&options)
        if self.ndiSend == nil {
            print("ERROR: Failed to create sender")
        } else {
            print("Successfully created sender")
        }
    }

    public func stop() {
        if ndiSend != nil {
            NDIlib_send_destroy(ndiSend)
            ndiSend = nil
        }
    }

    public func send(_ sampleBuffer: CMSampleBuffer) {
        if ndiSend == nil {
            print("ERROR: NDI instance is nil")
            return
        }

        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            print("Failed to get image buffer")
            return
        }

        var video_frame = NDIlib_video_frame_v2_t()
        video_frame.frame_rate_N = 30000
        video_frame.frame_rate_D = 1001
        video_frame.xres = 640
        video_frame.yres = 480
        video_frame.FourCC = NDIlib_FourCC_type_BGRX
        video_frame.frame_format_type = NDIlib_frame_format_type_progressive
        video_frame.picture_aspect_ratio = 1.777777777777778
        video_frame.line_stride_in_bytes = 2560
        video_frame.p_metadata = nil

        CVPixelBufferLockBaseAddress(imageBuffer, .readOnly)
        guard let bufferRawPointer = CVPixelBufferGetBaseAddress(imageBuffer) else { return }
        let dataPointer = bufferRawPointer.assumingMemoryBound(to: UInt8.self)
        video_frame.p_data = dataPointer
        CVPixelBufferUnlockBaseAddress(imageBuffer, .readOnly)

        NDIlib_send_send_video_async_v2(ndiSend, &video_frame)

    }
}
